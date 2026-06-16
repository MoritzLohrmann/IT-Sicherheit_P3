#include <stdio.h>
extern long checksum(const long *arr, long len);
int main(void) {
    long a[] = {1, 2, 3, 4};
    printf("checksum = %ld\n", checksum(a, 4));
    return 0;
}