CFLAGS = -fPIC -Wall -g
CC = gcc

EXECUTABLES = mains maindloop maindrec

BASIC = basicClassification
LOOP = advancedClassificationLoop
REC = advancedClassificationRecursion

OBJS = $(BASIC).o $(LOOP).o $(REC).o

all: $(EXECUTABLES)

mains: main.o recursives
	$(CC) $(CFLAGS) -o $@ $^

# maindloop: a main program linked to libclassloops.so
maindloop: main.o loopd
	$(CC) -o $@ $^

#maindrec: a main program linked to libclassrec.so
maindrec: main.o recursived
	$(CC) -o $@ $^

# All object files to be built depend on NumClass.h
# They will otherwise be built according to the built-in rule
$(OBJS): NumClass.h

recursives: $(REC).o $(BASIC).o 
	$(AR) rcs libclassrec.a $^

recursived: $(REC).o $(BASIC).o
	$(CC) $(CFLAGS) -shared -o libclassrec.so $^

loops: $(LOOP).o $(BASIC).o
	$(AR) rcs libclassloops.a $^

loopd: $(LOOP).o $(BASIC).o
	$(CC) $(CFLAGS) -shared -o libclassloops.so $^

# clean: delete all generated files
clean:
	rm -f $(EXECUTABLES) $(OBJS) libclassloops.a libclassrec.a libclassrec.so libclassloops.so

.PHONY: all clean
