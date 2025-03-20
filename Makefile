#----------------------------------------
# Makefile for Fast Dice Notation (FDN)
#
# Build Targets:
#   all:     		Build the main executable
#   clean:   		Remove all generated files
#	directories: 	Create the directories (mostly used by this file)
#
# Author: Logan Rivera
#
#----------------------------------------

# Project Structure
BIN_DIR    := bin
BUILD_DIR  := build
SRC_DIR    := src
INCLUDE_DIR := $(BUILD_DIR)/include
MY_INCLUDE_DIR := $(SRC_DIR)/include

# Toolchain
CXX       := g++
LEX       := flex
BISON     := bison

# Compiler Flags
CXXFLAGS  := -Wall -Wextra -g -O0 -std=c++23 -I$(INCLUDE_DIR) -I$(MY_INCLUDE_DIR)
LEXFLAGS  := -Wno-sign-compare

# Generated Files
PARSE_SRC := $(BUILD_DIR)/src/fdnparse.cpp
LEX_SRC   := $(BUILD_DIR)/src/fdnlex.cpp
PARSE_HDR := $(INCLUDE_DIR)/fdnparse.h

# Targets
TARGET    := $(BIN_DIR)/fdn
OBJS      := $(BUILD_DIR)/obj/main.o \
             $(BUILD_DIR)/obj/fdnlex.o \
             $(BUILD_DIR)/obj/fdnparse.o

# Phony Targets
.PHONY: all clean directories

all: directories $(TARGET)

clean:
	rm -rf $(BUILD_DIR) $(BIN_DIR)

directories:
	@mkdir -p $(BIN_DIR) $(BUILD_DIR)/obj $(BUILD_DIR)/src $(INCLUDE_DIR)

# Main executable
$(TARGET): $(OBJS)
	$(CXX) $^ -o $@

# Main program
$(BUILD_DIR)/obj/main.o: $(SRC_DIR)/main.cpp $(PARSE_HDR)
	$(CXX) $(CXXFLAGS) -c $< -o $@

# Parser generated files
$(PARSE_SRC) $(PARSE_HDR): $(SRC_DIR)/fdnparse.y
	$(BISON) --defines=$(PARSE_HDR) -o $(PARSE_SRC) $<

# Lexer generated file
$(LEX_SRC): $(SRC_DIR)/fdnlex.l $(PARSE_HDR)
	$(LEX) -o $@ $<

# Build rules for generated sources
$(BUILD_DIR)/obj/fdnparse.o: $(PARSE_SRC)
	$(CXX) $(CXXFLAGS) -c $< -o $@

$(BUILD_DIR)/obj/fdnlex.o: $(LEX_SRC)
	$(CXX) $(CXXFLAGS) $(LEXFLAGS) -x c++ -c $< -o $@

# Header dependency tracking
DEPFILES := $(OBJS:.o=.d)
-include $(DEPFILES)