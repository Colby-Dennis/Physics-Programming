#include <iostream>

__global__
void greet() {
    printf("Hello World!");
}

int main(void) {
    greet<<<1,1>>>();

    return 0;
}