/* -*- Mode:C++; c-file-style:"gnu"; indent-tabs-mode:nil; -*- */
/**
 * Copyright (c) 2014-2016,  Regents of the University of California,
 *                           Arizona Board of Regents,
 *                           Colorado State University,
 *                           University Pierre & Marie Curie, Sorbonne University,
 *                           Washington University in St. Louis,
 *                           Beijing Institute of Technology,
 *                           The University of Memphis.
 *
 * This file is part of ndn-tools (Named Data Networking Essential Tools).
 * See AUTHORS.md for complete list of ndn-tools authors and contributors.
 *
 * ndn-tools is free software: you can redistribute it and/or modify it under the terms
 * of the GNU General Public License as published by the Free Software Foundation,
 * either version 3 of the License, or (at your option) any later version.
 *
 * ndn-tools is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY;
 * without even the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR
 * PURPOSE.  See the GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License along with
 * ndn-tools, e.g., in COPYING.md file.  If not, see <http://www.gnu.org/licenses/>.
 *
 * @author Jerald Paul Abraham <jeraldabraham@email.arizona.edu>
 * @author Zhuo Li <zhuoli@email.arizona.edu>
 */

#include "../include/ndnpeek.hpp"
#include "../include/version.hpp"
#include "ndnpeek.cpp"
#include <ndn-cxx/util/io.hpp>
#include <boost/program_options.hpp>
#include "ros/ros.h"
#include "std_msgs/String.h"

std::string lastData = "init last data";
std::string interestFromSLAM = "ndn:/example/init interest";
std::string responseData = "init response data";
bool ifNewInterest = false;
namespace ndn {
namespace peek {

namespace po = boost::program_options;

static void
usage(std::ostream& os, const po::options_description& options)
{
  os << "Usage: ndnpeek [options] ndn:/name\n"
        "\n"
        "Fetch one data item matching the name prefix and write it to standard output.\n"
        "\n"
     << options;
}

static int
main(int argc, char* argv[]) {

  while(1) {
      if (ifNewInterest == true) {
          PeekOptions options;
          options.isVerbose = false;
          options.mustBeFresh = true;
          options.wantRightmostChild = false;
          options.wantPayloadOnly = true;
          options.minSuffixComponents = -1;
          options.maxSuffixComponents = -1;
          options.interestLifetime = time::milliseconds(-1);
          options.timeout = time::milliseconds(1000);
          options.prefix = interestFromSLAM;

          Face face;
          NdnPeek program(face, options);

          try {
            program.start();
            face.processEvents(program.getTimeout());
          }
          catch (const std::exception& e) {
            std::cerr << "ERROR: " << e.what() << std::endl;
            return 1;
          }

          ResultCode result = program.getResultCode();
          if (result == ResultCode::TIMEOUT && options.isVerbose) {
            std::cerr << "TIMEOUT" << std::endl;
          }
          else {
            responseData = program.getData();
          }
          ifNewInterest = false;
      }
      
  }
  return 0;
  //return static_cast<int>(result);
}

} // namespace peek
} // namespace ndn
void chatterCallback(const std_msgs::String::ConstPtr& msg) {
    std::cerr << "I heared interest from real_mrslam node: " << msg->data.c_str() << std::endl;
    interestFromSLAM = msg->data.c_str();
    ifNewInterest = true;
}
void *threadForROSListenerInterestFunc(void* param) {
    ros::NodeHandle n;
    ros::Subscriber sub = n.subscribe("/robot_0/ProvideInterest", 1000, chatterCallback);
    ros::spin();
}
void* Thread_for_PubResponseData(void* param) {
  ros::NodeHandle publishProvideData;
  ros::Publisher _publishProvideData = publishProvideData.advertise<std_msgs::String>("ResponseData", 1000);
  ros::Rate sub_loop_rate(100);
  while (1) {
    ros::spinOnce();
    std_msgs::String msg;
    std::string ss = responseData;
    msg.data = ss;
    if (ss != "init data" && lastData != ss) {
      _publishProvideData.publish(msg);
      lastData = ss;
    }    
    sub_loop_rate.sleep();
  }
}
int main(int argc, char** argv) {
  ros::init(argc, argv, "consumer");
  pthread_t threadForROSResponseData;
  pthread_t threadForROSListenerInterest;
  pthread_create(&threadForROSResponseData, NULL, Thread_for_PubResponseData, NULL);
  pthread_create(&threadForROSListenerInterest, NULL, threadForROSListenerInterestFunc, NULL);
  return ndn::peek::main(argc, argv);
}
