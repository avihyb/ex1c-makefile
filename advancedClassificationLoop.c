#include "NumClass.h"
#include <stdio.h>

int power(int num, int pow){
    int ans = 1;
    for(int i = 1; i <= pow; i++){
    ans *= num;
    }
    return ans;
}

int isArmstrong(int x){
    int digit = 0;
    int num = 0;
    int originalNum = x;

    for(int i = 0; i <= 9; i++){
        if(x == i){
            return 1;
        }
    }

    while(x > 0){    
        digit++;
        x = x / 10;
    }

    x = originalNum;
    

    while (x > 0)
    {
        int currentDigit = x % 10;
        num = num + power(currentDigit, digit);
        x = x/10;
        
    }
    
    if(num == originalNum){
        return 1;
    } else {
        return 0;
    }
}


int isPalindrome(int x) {
    int digit = 0;
    int originalNum = x;
    
    while (x > 0) {
        digit++;
        x = x / 10;
    }

    char stringNum[digit + 1];
    sprintf(stringNum, "%d", originalNum);

    int i = 0;
    while (originalNum > 0) {
        if (stringNum[i] != originalNum % 10 + '0') {
            return 0;
        }
        i++;
        originalNum = originalNum / 10;
    }

    return 1;
}
