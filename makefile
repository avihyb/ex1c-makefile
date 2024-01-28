
LOOP=advancedClassificationLoop
REC=advancedClassificationRecursion
BASIC=basicClassification
FLAG=-Wall -g -fPIC
CC=gcc
AR=ar
EXECUTEABLES = mains maindloop maindrec

# Compiling Source Files:

main.o: main.c NumClass.h
	$(CC) $(FLAG) -c main.c -o main.o

$(LOOP).o: $(LOOP).c NumClass.h
	$(CC) $(FLAG) -c $(LOOP).c -o $(LOOP)

$(REC).o: $(REC).c NumClass.h
	$(CC) $(FLAG) -c $(REC).c -o $(REC)

$(BASIC).o: $(BASIC).c NumClass.h
	$(CC) $(FLAG) -c $(BASIC).c -o $(BASIC)

# loops: creates the static library libclasslops.a
loops: $(LOOP) $(BASIC)
	ar rcs libclassloops.a $(LOOP) $(BASIC)

# recursives: creates the static library libclassrec.a
recursives: $(REC) $(BASIC) 
	ar rcs libclassrec.a $(REC) $(BASIC)

# recursived: creates the dynamic library libclassrec.so
recursived: $(REC) $(BASIC) 
	gcc $(FLAG) -shared -o libclassrec.so $(REC) $(BASIC) 

# loopd: creates the dynamic library libclassloops.so
loopd: $(LOOP) $(BASIC)
	gcc $(FLAG) -shared -o libclassloops.so $(LOOP) $(BASIC)

# mains: creates a main program linked to libclassrec.a
mains: main.o libclassrec.a 
	gcc $(FLAG) -o mains main.o -L. -lclassrec

# maindloop: creates a main program linked to libclassloops.so
maindloop: main.o libclassloops.so
	gcc -o maindloop main.o -L. -lclassloops

#maindrec: creates a main program linked to libclassrec.so
maindrec: main.o libclassrec.so 
	gcc -o maindrec main.o -L. -lclassrec

# all: compiles all libraries and programs (do no re compile)
all: $(EXECUTEABLES)

# clean: deletes all the compiled files except of .h, .c, .txt and the makefile itself
clean:
	rm -f libclassloops.a libclassrec.a libclassrec.so libclassloops.so $(EXECUTEABLES) *.o *.txt~

.PHONY: all clean
