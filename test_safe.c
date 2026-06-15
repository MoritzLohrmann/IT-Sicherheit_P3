#include <stdio.h>
#include <stddef.h>

extern size_t safe_strcpy(char *dst, size_t dst_size, const char *src);

int main(void) {
    char a[16];
    size_t n1 = safe_strcpy(a, sizeof(a), "Hallo");          // kuerzer
    printf("kuerzer: kopiert=%zu dst=%s\n", n1, a);

    char b[8];
    size_t n2 = safe_strcpy(b, sizeof(b), "ABCDEFG");        // gleich
    printf("gleich:  kopiert=%zu dst=%s\n", n2, b);

    char c[8];
    size_t n3 = safe_strcpy(c, sizeof(c), "viel zu lang");   // laenger
    printf("laenger: kopiert=%zu dst=%s\n", n3, c);

    return 0;
}