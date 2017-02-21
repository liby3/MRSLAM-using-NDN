# 项目路径
CUR_DIR     = $(shell pwd)
SRC_DIR     = $(CUR_DIR)/src
LIB_DIR     = $(CUR_DIR)/lib
INCLUDE_DIR = $(SRC_DIR)/include
SOURCE_DIR  = $(SRC_DIR)/source
BUILD_DIR   = $(CUR_DIR)/build
OBJ_DIR     = $(BUILD_DIR)/obj
BIN_DIR     = $(BUILD_DIR)/bin
PROGRAM     = producer

# 文件路径
EXTENSION   = cpp
SRCS        = $(wildcard $(SOURCE_DIR)/*.$(EXTENSION))
OBJS        = $(patsubst %.$(EXTENSION), $(OBJ_DIR)/%.o, $(notdir $(SRCS)))

# 编译器及选项
CC = g++
CFLAGS = -Wall -g -std=c++0x
LDFLAGS = -lm -lpthread -lboost_system $(shell pkg-config --cflags --libs libndn-cxx)
INCLUDE = -I$(INCLUDE_DIR)

.PHONY: clean rebuild help run rebuild nfdc doc

all: $(OBJS) $(BIN_DIR)
	$(CC) -o $(BIN_DIR)/$(PROGRAM) $(OBJS) $(LDFLAGS)

$(OBJ_DIR)/%.o: $(SOURCE_DIR)/%.$(EXTENSION) $(OBJ_DIR)
	$(CC) -o $@ -c $< $(CFLAGS) $(INCLUDE)

$(BIN_DIR): $(BUILD_DIR)
	mkdir $(BIN_DIR)

$(OBJ_DIR): $(BUILD_DIR)
	mkdir $(OBJ_DIR)

$(BUILD_DIR):
	mkdir $(BUILD_DIR)

run:
	sudo .$(BIN_DIR)/$(PROGRAM) || { echo "Build the target first..."; exit 1; }

nfdc:
	nfd-start &
	sudo nfdc set-strategy ndn:/place ndn:/locahost/nfd/strategy/broadcast

clean:
	rm -rf $(BUILD_DIR)

rebuild: clean all

help:
	@echo "make                     -------- make target by modify time"
	@echo "make clean               -------- clean target"
	@echo "make rebuild             -------- rebuild the target"
	@echo "make run                 -------- run the target"
	@echo "make nfdc ip=192.168.1.1 -------- start nfd and register car"
