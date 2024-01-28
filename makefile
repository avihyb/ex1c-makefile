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

libclassloops.a:basicClassification.o advancedClassificationLoop.o
	ar rcs libclassloops.a basicClassification.o advancedClassificationLoop.o
	ranlib libclassloops.a

libclassrec.a: basicClassification.o advancedClassificationRecursion.o
	ar rcs libclassrec.a basicClassification.o advancedClassificationRecursion.o
	ranlib libclassrec.a

libclassloops.so: basicClassification.c advancedClassificationLoop.c basicClassification.o advancedClassificationLoop.o
	gcc -Wall basicClassification.o advancedClassificationLoop.o -shared -o libclassloops.so

libclassrec.so: basicClassification.c advancedClassificationRecursion.c basicClassification.o advancedClassificationRecursion.o	
	gcc -Wall  basicClassification.o advancedClassificationRecursion.o -shared -o libclassrec.so

main.o: main.c
	gcc -Wall -c main.c

basicClassification.o: basicClassification.c
	gcc -Wall -c basicClassification.c

advancedClassificationLoop.o: advancedClassificationLoop.c 
	gcc -Wall -fPIC -c basicClassification.c advancedClassificationLoop.c

advancedClassificationRecursion.o: advancedClassificationRecursion.c 
	gcc -Wall -fPIC -c basicClassification.c advancedClassificationRecursion.c

clean:
	rm *.so *.a *.o mains maindloop maindrec
