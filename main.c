#include <stdio.h>
#include "NumClass.h"

int main(){
    int a;
    int b;

    scanf("%d", &a);
    scanf("%d", &b);


    for(int i = a; i <= b; i++){
        if(isPrime(i) == 1){
            printf("%d ", i);
        }
    }
    printf("\n");
    for(int i = a; i <= b; i++){
        if(isArmstrong(i) == 1){
            printf("%d ", i);
        }
    }
    printf("\n");
    for(int i = a; i <= b; i++){
        if(isStrong(i) == 1){
            printf("%d ", i);
        }
    }
    printf("\n");
    for(int i = a; i <= b; i++){
        if(isPalindrome(i) == 1){
            printf("%d ", i);
        }
    }
    printf("\n"); 
}