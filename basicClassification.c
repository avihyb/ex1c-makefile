#include "NumClass.h"

int isPrime(int x){
    if(x < 1){
        return 0;
    }

    if(x == 1){
        return 1;
    }

    for(int i = 2; i * i <= x; ++i)
    {
        if (x % i == 0)
        {
            return 0;
        }
    }
    return 1;
}

int factorial(int n) {
    int result = 1;

    for (int i = 1; i <= n; ++i) {
        result *= i;
    }

    return result;
}

int isStrong(int x){
    int original = x;
    int sum = 0;

    if(x == 0){
        return 0;
    }

    while(x > 0){
        int digit = x % 10;
        sum = sum + factorial(digit);
        x = x / 10;
    }
    
    return (sum == original) ? 1 : 0;
}