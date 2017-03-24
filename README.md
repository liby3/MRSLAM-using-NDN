# ROSProjet
smart car based ROS system, using ndn to transform data. The operating system is ubuntu 14.04 LTS.

## 1.	NDN Install

### 1.1.	ndn-cxx

	sudo apt-get install build-essential libcrypto++-dev libsqlite3-dev libboost-all-dev libssl-dev

	git clone https://github.com/named-data/ndn-cxx.git
	
	cd ndn-cxx
	
	./waf configure
	
	./waf
	
	sudo ./waf install
	
	sudo ldconfig

(option):

	sudo apt-get install doxygen graphviz python-sphinx python-pip
	
	sudo pip install sphinxcontrib-doxylink sphinxcontrib-googleanalytics

### 1.2.	nfd

	sudo apt-get install software-properties-common
	
	sudo add-apt-repository ppa:named-data/ppa
	
	sudo apt-get update
	
	sudo apt-get install nfd

## 2.	NFD methods
nfd depends on ndn-cxx library and it kinds a set of tools for developers. 

### 2.1.	nfdc

	nfdc register ndn:/example/ udp://xxx.xxx.xxx.xxx (another machine's IP address, should under the sanme net)
	
	nfdc set-strategy ndn:/example /localhost/nfd/strategy/multicast (according to your needs, I use multicast)

More information about NFD, click http://named-data.net/doc/NFD/current/manpages.html

## 3.	Start our communication
This is only a demo for ndn. We establish two basic sets, consumer and producer.
-	Set two machines and set their IPs in the same net so that they can ping each other. AP or ad-hoc is available. We assume car 1 is 10.0.0.2 and car 2 is 10.0.0.3.
-	Execute 

	nfd-start

	on both machines.
-	on machine 1: 
	
	nfdc register ndn:/example/ udp://10.0.0.3

	nfdc set-strategy ndn:/example /localhost/nfd/strategy/multicast
-	on machine 2:
	
	nfdc register ndn:/example/ udp://10.0.0.2

	nfdc set-strategy ndn:/example /localhost/nfd/strategy/multicast
-	We assume machine 1 producer, machine 2 consumer:
	on machine 1:

		sudo ./producer ndn:/example
	on machine 2:
		sudo ./consumer ndn:/example/testFromM2/ -f -p -w 1000

