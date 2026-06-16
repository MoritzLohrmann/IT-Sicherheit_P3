<<<<<<< HEAD
// vuln.c
#include <stdio.h>
#include <unistd.h>
void unlock(unsigned long token) {
if (token == 0xC0FFEE)
puts("[*] Stufe 1: Token akzeptiert.");
else
puts("[!] Stufe 1: Falscher Token.");
}
void grant_access(unsigned long uid, unsigned long level) {
printf("[*] Stufe 2: Zugriff fuer UID=%lu auf Level %lu gesetzt.\n",
uid, level);
}
void print_flag(void) {
puts("[+] FLAG{rop_chains_sind_machbar}");
}
void vulnerable(void) {
char buf[64];
read(0, buf, 512); // klassischer Stack-Buffer-Overflow
}
int main(void) {
setvbuf(stdout, NULL, _IONBF, 0);
vulnerable();
return 0;
}
=======
// vuln.c
#include <stdio.h>
#include <unistd.h>
void unlock(unsigned long token) {
if (token == 0xC0FFEE)
puts("[*] Stufe 1: Token akzeptiert.");
else
puts("[!] Stufe 1: Falscher Token.");
}
void grant_access(unsigned long uid, unsigned long level) {
printf("[*] Stufe 2: Zugriff fuer UID=%lu auf Level %lu gesetzt.\n",
uid, level);
}
void print_flag(void) {
puts("[+] FLAG{rop_chains_sind_machbar}");
}
void vulnerable(void) {
char buf[64];
read(0, buf, 512); // klassischer Stack-Buffer-Overflow
}
int main(void) {
setvbuf(stdout, NULL, _IONBF, 0);
vulnerable();
return 0;
}
>>>>>>> 4773b1585f4737ef13ae20eee0e14b097dac7ec0
