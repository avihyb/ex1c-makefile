CFLAGS = -fPIC -Wall -g
CC = gcc

EXECUTABLES = mains maindloop maindrec

BASIC = basicClassification
LOOP = advancedClassificationLoop
REC = advancedClassificationRecursion

OBJS = $(BASIC).o $(LOOP).o $(REC).o

all: $(EXECUTABLES)

mains: main.o libclassrec.a 
    $(CC) $(CFLAGS) -o $@ $^

# maindloop: a main program linked to libclassloops.so
maindloop: main.o libclassloops.so
    $(CC) -o $@ $^

#maindrec: a main program linked to libclassrec.so
maindrec: main.o libclassrec.so 
    $(CC) -o $@ $^

# All object files to be built depend on NumClass.h
# They will otherwise be built according to the built-in rule
$(OBJS): NumClass.h

libclassrec.a: $(REC).o $(BASIC).o 
    $(AR) rcs $@ $^

libclassrec.so: $(REC).o $(BASIC).o
    $(CC) $(CFLAGS) -shared -o $@ $^

libclassloops.a: $(LOOP).o $(BASIC).o
    $(AR) rcs $@ $^

libclassloops.so: $(LOOP).o $(BASIC).o
    $(CC) $(CFLAGS) -shared -o $@ $^

# clean: delete all generated files
clean:
    rm -f $(EXECUTABLES) $(OBJS) libclassloops.a libclassrec.a libclassrec.so libclassloops.so

.PHONY: all clean
