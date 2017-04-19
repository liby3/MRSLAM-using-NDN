// Copyright (c) 2013, Maria Teresa Lazaro Grañon
// All rights reserved.
//
// Redistribution and use in source and binary forms, with or without modification,
// are permitted provided that the following conditions are met:
//
//   Redistributions of source code must retain the above copyright notice, this
//   list of conditions and the following disclaimer.
//
//   Redistributions in binary form must reproduce the above copyright notice, this
//   list of conditions and the following disclaimer in the documentation and/or
//   other materials provided with the distribution.
//
//   Neither the name of the copyright holder nor the names of its
//   contributors may be used to endorse or promote products derived from
//   this software without specific prior written permission.
//
// THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND
// ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED
// WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
// DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE LIABLE FOR
// ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES
// (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES;
// LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON
// ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
// (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS
// SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.

#include "graph_comm.h"


/* @func      GraphComm::GraphComm (MRGraphSLAM* gslam, int idRobot, int nRobots, std::string base_addr, int typeExperiment)
 * @brief     init communcation model
 * @details   set experiment type, robot number, this robot ID, and this IP address
 */
GraphComm::GraphComm (MRGraphSLAM* gslam, int idRobot, int nRobots, std::string base_addr, int typeExperiment) {
  assert (typeExperiment >= 0 && typeExperiment <= 2 && "Not valid type of experiment");
  _typeExperiment = typeExperiment;
  _idRobot = idRobot;
  _nRobots = nRobots;
  _base_addr = base_addr;
  _gslam = gslam;
  std::stringstream my_addr;
  my_addr << base_addr << idRobot+1;
  std::cerr << "My address: " << my_addr.str() << std::endl;
  _iSock = socket(AF_INET,SOCK_DGRAM,IPPROTO_UDP);
  struct sockaddr_in sockAddr;
  sockAddr.sin_family=AF_INET;
  sockAddr.sin_addr.s_addr=inet_addr(my_addr.str().c_str());
  sockAddr.sin_port=htons(42001);
  bind(_iSock,(struct sockaddr*)&sockAddr,sizeof(sockAddr));
}


/* @func      void GraphComm::init_threads()
 * @brief     3 communication threads
 * @details   threads for send message, receive message and process message
 */
void GraphComm::init_threads() {
  sthread = boost::thread(&GraphComm::sendToThrd, this);
  rthread = boost::thread(&GraphComm::receiveFromThrd, this);
  pthread = boost::thread(&GraphComm::processQueueThrd, this);
}


/* @func      void GraphComm::init_network(RosHandler* rh)
 * @brief     init threads
 * @details   threads for send message, receive message and process message
 */
void GraphComm::init_network(RosHandler* rh) {
  _rh = rh;
  init_threads();
}


/* @func      bool GraphComm::inCommunicationRange(int r1, int r2)
 * @brief     communication range
 * @details   not used in REAL_EXPERIMENT
 */
bool GraphComm::inCommunicationRange(int r1, int r2) {
  return distanceSE2(_rh->getGroundTruth(r1), _rh->getGroundTruth(r2)) < SIM_COMM_RANGE;
}


/* @func      bool GraphComm::robotsInRange(std::vector<int>& robotsToSend)
 * @brief     construct the communcation robots list
 * @details   We use REAL_EXPERIMENT and all address are connected to robots number, such as
 *            there are 8 eight robots in total, its IP are 10.0.0.1(itself), 10.0.0.2 ....
 * @return    return the size of the list
 */
bool GraphComm::robotsInRange(std::vector<int>& robotsToSend) {
  robotsToSend.clear();
  if (_typeExperiment == REAL_EXPERIMENT) {
    //Send to all... the message will arrive if they are in range
    for (int r = 0; r < _nRobots; r++) {
      if (r != _idRobot) //Except to me!
        robotsToSend.push_back(r);
    }
  }
  else if (_typeExperiment == SIM_EXPERIMENT) {
    //Send if inCommunicationRange
    for (int r = 0; r < _nRobots; r++) {
      if (r != _idRobot){
      //Looking for ground truth pose
        if (inCommunicationRange(_idRobot, r))
          robotsToSend.push_back(r);
      }
    }
  }
  else if (_typeExperiment == BAG_EXPERIMENT) {
    //Send if recent ping
    ros::Time curr_time = ros::Time::now();
    for (int r = 0; r < _nRobots; r++) {
      if (r != _idRobot) {
        if ((curr_time.toSec() -_rh->getTimeLastPing(r).toSec()) < COMM_TIME) { 
        //Less than COMM_TIME seconds since last ping
          robotsToSend.push_back(r);
        }
      }
    }
  }
  return robotsToSend.size();
}


/* @func      void GraphComm::send(RobotMessage* cmsg, int rto)
 * @brief     send socket message to network
 * @details   send socket message.
 */
void GraphComm::send(RobotMessage* cmsg, int rto) {
  std::stringstream to_addr;
  to_addr << _base_addr << rto +1;
  struct sockaddr_in toSockAddr;
  toSockAddr.sin_family=AF_INET;
  toSockAddr.sin_addr.s_addr=inet_addr(to_addr.str().c_str());
  toSockAddr.sin_port=htons(42001);
  char bufferc [MAX_LENGTH_MSG];
  char* c = cmsg->toCharArray(bufferc, MAX_LENGTH_MSG); //  create buffer;
  size_t sizebufc = (c) ? (c-bufferc):0;
  if (sizebufc) {
    std::cout << "Send info to robot: " << rto << ". Address: " << to_addr.str() << ". Sent: " << sizebufc  << " bytes" << std::endl;
    sendto(_iSock, &bufferc, sizebufc, 0, (struct sockaddr*) &toSockAddr, sizeof(toSockAddr));
    if (_typeExperiment == REAL_EXPERIMENT)
      _rh->publishSentMsg(cmsg);
  }
}


/* @func      void GraphComm::sendToThrd()
 * @brief     send message to neighbour robot in the list
 * @details   We use socket to establish a UDP package and send it out.
 *            If we produce new local map vertex, we will send it, containing this robot ID, newest 5 poses information and
 *            the newest point cloud information.
 *            If we produce condensed graph, it means this robot has matched another robot, send condensed message.
 */
void GraphComm::sendToThrd() {
  int lastSentVertex = -1;
  std::vector<int> robotsToSend;
  while(1) {
    //_rh->publishProvideData();
    if (robotsInRange(robotsToSend)) {
      /* new local map produced, send new local map node. */
      if (_gslam->lastVertex()->id() != lastSentVertex) {
          lastSentVertex = _gslam->lastVertex()->id();
          /* send the newest 5 poses information, this robot ID and the lastest point cloud information */
          ComboMessage* cmsg = _gslam->constructComboMessage();
          //Send to robots in range
          for (size_t i = 0; i < robotsToSend.size(); i++) {
            int rto = robotsToSend[i];
            send(cmsg, rto);
          }
      }

      /* send condensed graph */
      for (size_t i = 0; i < robotsToSend.size(); i++) {
          int rto = robotsToSend[i];
          /* send condensed map */
          CondensedGraphMessage* gmsg = _gslam->constructCondensedGraphMessage(rto);
          //GraphMessage* gmsg = _gslam->constructGraphMessage(rto);
          if (gmsg) {
              send(gmsg, rto);
          }
      }
    }
    usleep(150000);
  }
}


/* @func      RobotMessage* GraphComm::receive()
 * @brief     receive socket message from network
 * @details   receive socket message and return it.
 */
RobotMessage* GraphComm::receive() {
  struct sockaddr_in toSockAddr;
  int toSockAddrLen=sizeof(struct sockaddr_in);
  
  int sizebuf = MAX_LENGTH_MSG;
  char buffer[sizebuf];

  int nbytes = recvfrom(_iSock, &buffer, sizebuf ,0,(struct sockaddr*)&toSockAddr, (socklen_t*)&toSockAddrLen);
  fprintf(stdout, "Received %i bytes.\n", nbytes);
  //Deserialize data
  RobotMessage *msg = _gslam->createMsgfromCharArray(buffer, nbytes);
  return msg;
}


/* @func      void GraphComm::receiveFromThrd()
 * @brief     receive message from other robot and store it into message queue
 * @details   publish the receive message among ROS nodes(I don't know why) as well, take the newest vertex from
 *            local map as a reference vertex to match if the coming message is local map data.
 */
void GraphComm::receiveFromThrd() {
  while(1) {
    //Receive data
    RobotMessage* msg = receive();
    //fprintf(stderr, "Received info from: %i\n", msg->robotId());
    if (_typeExperiment == REAL_EXPERIMENT){
      _rh->publishReceivedMsg(msg);
      _rh->publishPing(msg->robotId());
    }

    StampedRobotMessage vmsg;
    vmsg.msg = msg;
    /* take the newest vertex as the reference vertex */
    vmsg.refVertex = _gslam->lastVertex();
    boost::mutex::scoped_lock lock(_queueMutex);
    _queue.push(vmsg);
  }
}


/* @func      void GraphComm::processQueueThrd()
 * @brief     how to deal with the message stored in the message queue from other robots
 * @details   use addInterRobotData(vmsg) method to decide message type and deal with it
 */
void GraphComm::processQueueThrd() {
  while(1) {
    if (!_queue.empty()) {
      boost::mutex::scoped_lock lock(_queueMutex);
      StampedRobotMessage vmsg = _queue.front();
      _gslam->addInterRobotData(vmsg);
      _queue.pop();
    }
    else {
      usleep(10000);
    }
  }
}