BASIC = basicClassification
LOOP = advancedClassificationLoop
REC = advancedClassificationRecursion
AR = ar
GC = gcc
FLAGS = -Wall

all: mains maindloop maindrec loops recursives 

loops: libclassloops.a

recursives: libclassrec.a

recursived: libclassrec.so

loopd: libclassloops.so

mains: main.o recursives
	$(GC) $(FLAGS) -o mains main.o libclassrec.a

maindloop: main.o libclassloops.so
	$(GC) $(FLAGS) main.o ./libclassloops.so -o maindloop

maindrec: main.o libclassrec.so
	$(GC) $(FLAGS) main.o ./libclassrec.so -o maindrec

libclassloops.a: $(BASIC).o $(LOOP).o
	$(AR) rcs libclassloops.a $(BASIC).o $(LOOP).o
	ranlib libclassloops.a

libclassrec.a: $(BASIC).o $(REC).o
	$(AR) rcs libclassrec.a $(BASIC).o $(REC).o
	ranlib libclassrec.a

libclassloops.so: $(BASIC).c $(LOOP).c $(BASIC).o $(LOOP).o
	$(GC) $(FLAGS) $(BASIC).o $(LOOP).o -sh$(AR)ed -o libclassloops.so

libclassrec.so: $(BASIC).c $(REC).c $(BASIC).o $(REC).o	
	$(GC) $(FLAGS)  $(BASIC).o $(REC).o -sh$(AR)ed -o libclassrec.so

main.o: main.c
	$(GC) $(FLAGS) -c main.c

$(BASIC).o: $(BASIC).c
	$(GC) $(FLAGS) -c $(BASIC).c

$(LOOP).o: $(LOOP).c 
	$(GC) $(FLAGS) -fPIC -c $(BASIC).c $(LOOP).c

$(REC).o: $(REC).c 
	$(GC) $(FLAGS) -fPIC -c $(BASIC).c $(REC).c

clean:
	rm *.so *.a *.o mains maindloop maindrec
