mkfile_path := $(abspath $(lastword $(MAKEFILE_LIST)))
current_dir := $(notdir $(patsubst %/,%,$(dir $(mkfile_path))))
CFILES:=$(wildcard *-lib.c)
P=GENERIC
OBJECTS=$(patsubst %.c, %.o, $(CFILES))
CFLAGS=`pkg-config --cflags glib-2.0` -g -Wall -std=gnu11 -O3
LDLIBS=`pkg-config --libs glib-2.0` -lm
CC=cc
TEST_SRC=$(wildcard test/*test.c)
TESTS=$(patsubst %.c,%,$(TEST_SRC))

$(P): $(OBJECTS)

$(TESTS): $(OBJECTS)

.PHONY: test
test:  $(TESTS)
	gtester --verbose $(TESTS)	
	echo ' '
	valgrind $(TESTS)
	rm $(TESTS)


.PHONY: clean
clean: 
	rm $(OBJECTS)





