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

#include "graph_slam.h"
#include "graph_manipulator.h"

GraphSLAM::GraphSLAM():_vf(0){ 
  _firstRobotPose = 0; 
  _lastVertex = 0;  
  _idRobot = 0; 
  _baseId = 10000; 
  _runningVertexId = 0; 
  _runningEdgeId = 0;
  _graph = new SparseOptimizer();
  _vf = VerticesFinder(_graph);
}


typedef BlockSolver< BlockSolverTraits<-1, -1> >  SlamBlockSolver;
typedef LinearSolverCSparse<SlamBlockSolver::PoseMatrixType> SlamLinearSolver;

void GraphSLAM::init(double resolution, double kernelRadius, int windowLoopClosure_, double maxScore_, double inlierThreshold_, int minInliers_){
  boost::mutex::scoped_lock lockg(graphMutex);

  //Init graph
  SlamLinearSolver* linearSolver = new SlamLinearSolver();
  linearSolver->setBlockOrdering(false);
  SlamBlockSolver* blockSolver = new SlamBlockSolver(linearSolver);
  OptimizationAlgorithmGaussNewton* solver = new OptimizationAlgorithmGaussNewton(blockSolver);
  _graph->setAlgorithm(solver);
  _graph->setVerbose(false);

  //Init scan matchers
  _closeMatcher.initializeKernel(resolution, kernelRadius);
  _closeMatcher.initializeGrid(Eigen::Vector2f(-15, -15), Eigen::Vector2f(15, 15), resolution);
  _LCMatcher.initializeKernel(0.1, 0.5); //before 0.1, 0.5
  _LCMatcher.initializeGrid(Eigen::Vector2f(-35, -35), Eigen::Vector2f(35, 35), 0.1); //before 0.1
  cerr << "Grids initialized\n";


  windowLoopClosure = windowLoopClosure_;
  maxScore = maxScore_;
  inlierThreshold = inlierThreshold_;
  minInliers = minInliers_;

  //
  _odominf =  100 * Eigen::Matrix3d::Identity();
  _odominf(2,2) = 1000;

  _SMinf = 1000 * Eigen::Matrix3d::Identity();
  _SMinf(2,2) = 10000;
}

void GraphSLAM::setIdRobot(int idRobot){
  _idRobot = idRobot;
}

void GraphSLAM::setBaseId(int baseId){
  _baseId = baseId;
}

void GraphSLAM::setInitialData(SE2 initialTruePose, SE2 initialOdom, RobotLaser* laser){
  boost::mutex::scoped_lock lockg(graphMutex);

  _lastOdom = initialOdom;
  //Add initial vertex
  _lastVertex = new VertexSE2;

  _lastVertex->setEstimate(initialTruePose);
  _lastVertex->setId(idRobot() * baseId());

  //Add covariance information
  //VertexEllipse *ellipse = new VertexEllipse();
  //Matrix3f cov = Matrix3f::Zero(); //last vertex has zero covariance
  //ellipse->setCovariance(cov);
  //_lastVertex->setUserData(ellipse);
  _lastVertex->setUserData(laser);
  
  std::cout << 
    "Initial vertex: " << _lastVertex->id() << 
    " Estimate: "<< _lastVertex->estimate().translation().x() << 
    " " << _lastVertex->estimate().translation().y() << 
    " " << _lastVertex->estimate().rotation().angle() << std::endl;

  _graph->addVertex(_lastVertex);

  _firstRobotPose = _lastVertex;
  _firstRobotPose->setFixed(true);
}

void GraphSLAM::setInitialData(SE2 initialOdom, RobotLaser* laser){
  boost::mutex::scoped_lock lockg(graphMutex);

  _lastOdom = initialOdom;
  //Add initial vertex
  _lastVertex = new VertexSE2;

  _lastVertex->setEstimate(_lastOdom);
  _lastVertex->setId(idRobot() * baseId());
  
  //Add covariance information
  //VertexEllipse *ellipse = new VertexEllipse();
  //Matrix3f cov = Matrix3f::Zero(); //last vertex has zero covariance
  //ellipse->setCovariance(cov);
  //_lastVertex->setUserData(ellipse);
  _lastVertex->addUserData(laser);

  std::cout << 
    "Initial vertex: " << _lastVertex->id() << 
    " Estimate: "<< _lastVertex->estimate().translation().x() << 
    " " << _lastVertex->estimate().translation().y() << 
    " " << _lastVertex->estimate().rotation().angle() << std::endl;

  _graph->addVertex(_lastVertex);

  _firstRobotPose = _lastVertex;
  _firstRobotPose->setFixed(true);
}

void GraphSLAM::addData(SE2 currentOdom, RobotLaser* laser){
  boost::mutex::scoped_lock lockg(graphMutex);

  //Add current vertex
  VertexSE2 *v = new VertexSE2;

  SE2 displacement = _lastOdom.inverse() * currentOdom;
  SE2 currEst = _lastVertex->estimate() * displacement;

  v->setEstimate(currEst);
  v->setId(++_runningVertexId + idRobot() * baseId());
  //Add covariance information
  //VertexEllipse *ellipse = new VertexEllipse;
  //Matrix3f cov = Matrix3f::Zero(); //last vertex has zero covariance
  //ellipse->setCovariance(cov);
  //v->setUserData(ellipse);
  v->addUserData(laser);

  std::cout << std::endl << 
    "Current vertex: " << v->id() << 
    " Estimate: "<< v->estimate().translation().x() << 
    " " << v->estimate().translation().y() << 
    " " << v->estimate().rotation().angle() << std::endl;

  _graph->addVertex(v);

  //Add current odometry edge
  EdgeSE2 *e = new EdgeSE2;
  e->setId(++_runningEdgeId + idRobot() * baseId());
  e->vertices()[0] = _lastVertex;
  e->vertices()[1] = v;
      
  e->setMeasurement(displacement);
  
  // //Computing covariances depending on the displacement
  // Vector3d dis = displacement.toVector();
  // dis.x() = fabs(dis.x());
  // dis.y() = fabs(dis.y());
  // dis.z() = fabs(dis.z());
  // dis += Vector3d(1e-3,1e-3,1e-2);  
  // Matrix3d dis2 = dis*dis.transpose();
  // Matrix3d newcov = dis2.cwiseProduct(_odomK);

  e->setInformation(_odominf);
  _graph->addEdge(e);

  _odomEdges.insert(e);

  _lastOdom = currentOdom;
  _lastVertex = v;
}

void GraphSLAM::addDataSM(SE2 currentOdom, RobotLaser* laser){
  boost::mutex::scoped_lock lockg(graphMutex);

  //Add current vertex
  VertexSE2 *v = new VertexSE2;

  SE2 displacement = _lastOdom.inverse() * currentOdom;
  SE2 currEst = _lastVertex->estimate() * displacement;

  v->setEstimate(currEst);
  v->setId(++_runningVertexId + idRobot() * baseId());
  //Add covariance information
  //VertexEllipse *ellipse = new VertexEllipse;
  //Matrix3f cov = Matrix3f::Zero(); //last vertex has zero covariance
  //ellipse->setCovariance(cov);
  //v->setUserData(ellipse);
  v->addUserData(laser);

  std::cout << endl << 
    "--Current vertex: " << v->id() << std::endl;

  std::cerr << endl << 
    "--Current vertex: " << v->id() << std::endl;
    //" Estimate: "<< v->estimate().translation().x() << 
    //" " << v->estimate().translation().y() << 
    //" " << v->estimate().rotation().angle() << std::endl;

  _graph->addVertex(v);

  //Add current odometry edge
  EdgeSE2 *e = new EdgeSE2;
  e->setId(++_runningEdgeId + idRobot() * baseId());
  e->vertices()[0] = _lastVertex;
  e->vertices()[1] = v;
      

  OptimizableGraph::VertexSet vset;
  vset.insert(_lastVertex);
  int j = 1;
  int gap = 5;
  while (j <= gap){
    VertexSE2 *vj =  dynamic_cast<VertexSE2 *>(graph()->vertex(_lastVertex->id()-j));
    if (vj)
      vset.insert(vj);
    else
      break;
    j++;
  }

  SE2 transf;
  bool shouldIAdd = _closeMatcher.closeScanMatching(vset, _lastVertex, v,  &transf, maxScore);

  if (shouldIAdd){
    e->setMeasurement(transf);
    e->setInformation(_SMinf);
    cout << "[tranf] Trust scan matching ***  "<< endl;
  }else{ //Trust the odometry
    e->setMeasurement(displacement);
    cout << "[tranf] Trust odometry ###   " << endl;

    e->setInformation(_odominf);
  }

  _graph->addEdge(e);

  _lastOdom = currentOdom;
  _lastVertex = v;
}


RobotLaser* GraphSLAM::findLaserData(OptimizableGraph::Vertex* v){
  HyperGraph::Data* d = v->userData();

  while (d){
    RobotLaser* robotLaser = dynamic_cast<RobotLaser*>(d);
    if (robotLaser){
      return robotLaser;
    }else{
      d = d->next();
    }
  }

  return 0;
}


void GraphSLAM::checkHaveLaser(OptimizableGraph::VertexSet& vset){
  OptimizableGraph::VertexSet tmpvset = vset;
  for (OptimizableGraph::VertexSet::iterator it = tmpvset.begin(); it != tmpvset.end(); it++){
    OptimizableGraph::Vertex *vertex = (OptimizableGraph::Vertex*) *it;
    if (!findLaserData(vertex))
      vset.erase(*it);
  }
}


void GraphSLAM::checkCovariance(OptimizableGraph::VertexSet& vset){
  // we need now to compute the marginal covariances of all other vertices w.r.t the newly inserted one

  CovarianceEstimator ce(_graph);

  ce.setVertices(vset);
  ce.setGauge(_lastVertex);
  
  ce.compute();

  assert(!_lastVertex->fixed() && "last Vertex is fixed");
  assert(_firstRobotPose->fixed() && "first Vertex is not fixed");
  
  OptimizableGraph::VertexSet tmpvset = vset;
  for (OptimizableGraph::VertexSet::iterator it = tmpvset.begin(); it != tmpvset.end(); it++){
    VertexSE2 *vertex = (VertexSE2*) *it;
    
    Eigen::MatrixXd Pv = ce.getCovariance(vertex);
    Eigen::Matrix2d Pxy; Pxy << Pv(0,0), Pv(0,1), Pv(1,0), Pv(1,1);
    SE2 delta = vertex->estimate().inverse() * _lastVertex->estimate();	
    Eigen::Vector2d hxy (delta.translation().x(), delta.translation().y());
    double perceptionRange =1;
    if (hxy.x()-perceptionRange>0) 
      hxy.x() -= perceptionRange;
    else if (hxy.x()+perceptionRange<0)
      hxy.x() += perceptionRange;
    else
      hxy.x() = 0;

    if (hxy.y()-perceptionRange>0) 
      hxy.y() -= perceptionRange;
    else if (hxy.y()+perceptionRange<0)
      hxy.y() += perceptionRange;
    else
      hxy.y() = 0;
    
    double d2 = hxy.transpose() * Pxy.inverse() * hxy;
    if (d2 > 5.99)
      vset.erase(*it);
 
  }
  
}

void GraphSLAM::addNeighboringVertices(OptimizableGraph::VertexSet& vset, int gap) {
  OptimizableGraph::VertexSet temp = vset;
  for (OptimizableGraph::VertexSet::iterator it = temp.begin(); it!=temp.end(); it++) {
    OptimizableGraph::Vertex* vertex = (OptimizableGraph::Vertex*) *it;
    for (int i = 1; i <= gap; i++) {
      OptimizableGraph::Vertex *v = (OptimizableGraph::Vertex *) _graph->vertex(vertex->id()+i);
      if (v && v->id() != _lastVertex->id()) {
        OptimizableGraph::VertexSet::iterator itv = vset.find(v);
        if (itv == vset.end())
          vset.insert(v);
        else
          break;
      }
    }

    for (int i = 1; i <= gap; i++) {
      OptimizableGraph::Vertex* v = (OptimizableGraph::Vertex*) _graph->vertex(vertex->id()-i);
      if (v && v->id() != _lastVertex->id()) {
        OptimizableGraph::VertexSet::iterator itv = vset.find(v);
        if (itv == vset.end())
          vset.insert(v);
        else
          break;
      }
    }
  }
}


bool GraphSLAM::isMyVertex(OptimizableGraph::Vertex *v) {
  return (v->id()/baseId()) == idRobot();
}


/* @func     void GraphSLAM::findConstraints()
 * @brief    find single robot slam contraints, close circle detect?
 */
void GraphSLAM::findConstraints() {
  boost::mutex::scoped_lock lockg(graphMutex);

  //graph is quickly optimized first so last added edge is satisfied
  _graph->initializeOptimization();
  _graph->optimize(1);

  OptimizableGraph::VertexSet vset;
  _vf.findVerticesScanMatching( _lastVertex, vset);

  checkCovariance(vset);
  addNeighboringVertices(vset, 8);
  checkHaveLaser(vset);

  std::set<OptimizableGraph::VertexSet> setOfVSet;
  _vf.findSetsOfVertices(vset, setOfVSet);
      
 
  OptimizableGraph::EdgeSet loopClosingEdges;
  for (std::set<OptimizableGraph::VertexSet>::iterator it = setOfVSet.begin(); it != setOfVSet.end(); it++) {
    
    OptimizableGraph::VertexSet myvset = *it;
    
    OptimizableGraph::Vertex* closestV = _vf.findClosestVertex(myvset, _lastVertex); 
    
    if (closestV->id() == _lastVertex->id() - 1) //Already have this edge
      continue;

    SE2 transf;
    if (!isMyVertex(closestV) || (isMyVertex(closestV) && abs(_lastVertex->id() - closestV->id()) > 10)) {
      std::vector<SE2> results;
      //Loop Closing Edge
      bool shouldIAdd = _LCMatcher.scanMatchingLC(myvset,  closestV, _lastVertex,  results, maxScore);
      if (shouldIAdd) {
        for (unsigned int i =0; i< results.size(); i++) {
          EdgeSE2 *ne = new EdgeSE2;
          ne->setId(++_runningEdgeId + _baseId);
          ne->vertices()[0] = closestV;
          ne->vertices()[1] = _lastVertex;
          ne->setMeasurement(results[i]);
          ne->setInformation(_SMinf);
          loopClosingEdges.insert(ne);
          _SMEdges.insert(ne);
        }
      }
      else {
        std::cout << "Rejecting LC edge between " << closestV->id() << " and " << _lastVertex->id() << " [matching fail] " << std::endl;
      }
    }
    else {
      //Edge between close vertices
      bool shouldIAdd = _closeMatcher.closeScanMatching(myvset, closestV, _lastVertex, &transf, maxScore);
      if (shouldIAdd) {
        EdgeSE2 *ne = new EdgeSE2;
        ne->setId(++_runningEdgeId + _baseId);
        ne->vertices()[0] = closestV;
        ne->vertices()[1] = _lastVertex;
        ne->setMeasurement(transf);
        ne->setInformation(_SMinf);
        _graph->addEdge(ne);
        _SMEdges.insert(ne);
      }
      else {
        std::cout << "Rejecting edge between " << closestV->id() << " and " << _lastVertex->id() << " [matching fail] " << std::endl;
      }
    }
  }
  
  if (loopClosingEdges.size())
    addClosures(loopClosingEdges);
  checkClosures();
  updateClosures();
}

void GraphSLAM::addClosures(OptimizableGraph::EdgeSet loopClosingEdges){

  _closures.addEdgeSet(loopClosingEdges);
  _closures.addVertex(_lastVertex);
}

void GraphSLAM::checkClosures() {
  if (_closures.checkList(windowLoopClosure)) {
    cout << endl << "Loop Closure Checking." << endl;
    lcc.init(_closures.vertices(), _closures.edgeSet(), inlierThreshold);
    lcc.check();
    cout << "Best Chi2 = " << lcc.chi2() << endl;
    cout << "Inliers = " << lcc.inliers() << endl;

    if (lcc.inliers() >= minInliers) {
      LoopClosureChecker::EdgeDoubleMap results = lcc.closures();
      cout << "Results:" << endl;
      for (LoopClosureChecker::EdgeDoubleMap::iterator it= results.begin(); it!= results.end(); it++) {
        EdgeSE2* e = (EdgeSE2*) (it->first);
        cout << "Edge from: " << e->vertices()[0]->id() << " to: " << e->vertices()[1]->id() << ". Chi2 = " << it->second <<  endl;
        if (it->second < inlierThreshold) {
          cout << "Is an inlier. Adding to Graph" << endl;
          _graph->addEdge(e);
        }
      }
    }
  }
}


void GraphSLAM::updateClosures() {
  _closures.updateList(windowLoopClosure);
}


void GraphSLAM::optimize(int nrunnings) {
  boost::mutex::scoped_lock lockg(graphMutex);

  _graph->initializeOptimization();
  _graph->optimize(nrunnings);

  //Update laser data
  for (SparseOptimizer::VertexIDMap::const_iterator it = _graph->vertices().begin(); it != _graph->vertices().end(); ++it) {
    VertexSE2* v = dynamic_cast<VertexSE2*>(it->second);
    RobotLaser* robotLaser = findLaserData(v);
    if (robotLaser) 
      robotLaser->setOdomPose(v->estimate());
  }
}


bool GraphSLAM::saveGraph(const char *filename) {
  boost::mutex::scoped_lock lockg(graphMutex);
  return _graph->save(filename);
}


bool GraphSLAM::loadGraph(const char *filename) {
  boost::mutex::scoped_lock lockg(graphMutex);
  return _graph->load(filename);
}
