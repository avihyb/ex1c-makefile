#include "NumClass.h"

int isArmstrongRecursive(int x, int digits){
    if(x == 0){
        return 0;
    } else {
        int digit = x % 10;
        return power(digit, digits) + isArmstrongRecursive(x / 10, digits);
    }
}

int isArmstrong(int x){
    if(x >= 0 && x <= 9){
        return 1;
    }
    int digits = countDigits(x);
    int ans = isArmstrongRecursive(x, digits);
    if(ans == x){
        return 1;
     } else {
        return 0;
     }
}


int power(int num, int pow){
    int ans = 1;
    for(int i = 1; i <= pow; i++){
    ans *= num;
    }
    return ans;
}

int countDigits(int num){
    if(num == 0){
        return 0;
    } else {
        return 1 + countDigits(num / 10);
    }
}


int isPalindrome(int x){
    int digits = countDigits(x);
    int ans = isPalindromeRecursive(x, 0, digits);
    if(ans == x){
        return 1;
    }
    return 0;
}

int isPalindromeRecursive(int x, int original, int digits){
    if(digits == 0){
        return original;
    } else {
        int digit = x % 10;
        return isPalindromeRecursive(x / 10, original * 10 + digit, digits - 1);
    }
}
