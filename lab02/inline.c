#include <stdio.h>

//  inline function named "addNumbers" that takes two integers and returns their sum
static inline int addNumbers(int num1, int num2) {
    return num1 + num2;
}

int main() {
    // Call the "addNumbers" function with the arguments 5 and 7 and store the result in "sumResult"
    int sumResult = addNumbers(3, 6);

    // Print the result
    printf("Sum Result: %d\n", sumResult);

    return 0;
}

