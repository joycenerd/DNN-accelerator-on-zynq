#include <stdio.h>
#include <stdlib.h>
#include <string.h>

char* itob(int i) {
      static char bits[14] = {'0','0','0','0','0','0','0','0','0','0','0','0','0','0'};
      int bits_index = 13;
      while ( i > 0 ) {
         bits[bits_index--] = (i & 1) + '0';
         i = ( i >> 1);
      }
      return bits;
   }


int main()
{
    int i;
    FILE *fp=fopen("./cidx.txt","w");
	for(i=0;i<=12729;i++){
       char *bits=itob(i);
       fprintf(fp,"14'b%s:coef <= coeficient%d\n",bits,i);
	   printf("%s\n",bits); 
    }
}

// 4'b0000: coef <= coefficent00;