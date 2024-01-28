BASIC=basicClassification
LOOP=advancedClassificationLoop
REC=advancedClassificationRecursion
AR=ar

all: mains maindloop maindrec loops recursives 

loops: libclassloops.a

recursives: libclassrec.a

recursived: libclassrec.so

loopd: libclassloops.so

mains: main.o recursives
	gcc -Wall -o mains main.o libclassrec.a

maindloop: main.o libclassloops.so
	gcc -Wall main.o ./libclassloops.so -o maindloop

maindrec: main.o libclassrec.so
	gcc -Wall main.o ./libclassrec.so -o maindrec

libclassloops.a: $(BASIC).o $(LOOP).o
	ar rcs libclassloops.a $(BASIC).o $(LOOP).o
	ranlib libclassloops.a

libclassrec.a: $(BASIC).o $(REC).o
	ar rcs libclassrec.a $(BASIC).o $(REC).o
	ranlib libclassrec.a

libclassloops.so: $(BASIC).c $(LOOP).c $(BASIC).o $(LOOP).o
	gcc -Wall $(BASIC).o $(LOOP).o -shared -o libclassloops.so

libclassrec.so: $(BASIC).c $(REC).c $(BASIC).o $(REC).o	
	gcc -Wall  $(BASIC).o $(REC).o -shared -o libclassrec.so

main.o: main.c
	gcc -Wall -c main.c

$(BASIC).o: $(BASIC).c
	gcc -Wall -c $(BASIC).c

$(LOOP).o: $(LOOP).c 
	gcc -Wall -fPIC -c $(BASIC).c $(LOOP).c

$(REC).o: $(REC).c 
	gcc -Wall -fPIC -c $(BASIC).c $(REC).c

clean:
	rm *.so *.a *.o mains maindloop maindrec
