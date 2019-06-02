#include <bits/stdc++.h>
using namespace std;

typedef unsigned uint;
//--------------------------------------------------
#define FLT_SIGN_BITS 1 // float signed     field using bit
#define FLT_EXP_BITS 8  // float exponment  field using bits
#define FLT_MAT_BITS 23 // float mantissa   field using bits

#define FLT_SIGN_MASK 0x80000000U // float signed bit ,     32b'1000_0000_0000_0000_0000_0000_0000_0000
#define FLT_EXP_MASK 0x7f800000U  // float exponment bits , 32b'0111_1111_1000_0000_0000_0000_0000_0000
#define FLT_MAT_MASK 0x007fffffU  // float mantissa bits ,  32b'0000_0000_0111_1111_1111_1111_1111_1111

#define FLT_BASE_VAL 31 // float  base value
//--------------------------------------------------
void Get754Value32(float v, int *sign, int *exp, float *mat);
//int Set754Value32(float *v, int sign, int exp, float mat);
FILE *fp;
int num;

int main()
{
    /*float tt = -3456.482f;
    uint mm = *(uint *)&tt;
    char s[50];
    for(int i=0;i<32;i++)
    {
        s[i] = (mm&1) + '0';
        mm >>= 1;
    }
    for(int i=31;i>=0;i--)
    {
        printf("%c",s[i]);
        if(i%4==0) printf("_");
    }
    printf("\n");*/

//--------- read parameter file -------------------------------------
    float w_h1[16][784];
    float w_o[10][16];
    float b_h1[16];
    float b_o[10];
    int i, j , sign , exp;
    float mat;
    num = 0;
    fp = fopen("merge.txt" , "r");
    if (fp==NULL){
        puts("ERROR: read model.");
        exit(-1);
    }
    for (i=0;i<16;i++)
        for (j=0;j<784;j++)
        {
            fscanf(fp, "%x", (unsigned int*)&w_h1[i][j]);
            //printf("%f\n",w_h1[i][j]);
        }
    for (i=0;i<16;i++)
        fscanf(fp, "%x", (unsigned int*)&b_h1[i]);
    
    for (i=0;i<10;i++)
        for (j=0;j<16;j++)
            fscanf(fp, "%x", (unsigned int*)&w_o[i][j]);

    for (i=0;i<10;i++)
        fscanf(fp, "%x", (unsigned int*)&b_o[i]);
    fclose(fp);

    fp = fopen("crom.txt" , "w");
    fprintf(fp , "hidden layer's weight\n");
    for(i=0;i<16;i++)
    {
        for(j=0;j<784;j++)
        {
            sign = exp = mat = 0;
            Get754Value32(w_h1[i][j] , &sign , &exp , &mat);
        }
    }
    fprintf(fp , "hidden layer's bias\n");
    for(i=0;i<16;i++)
    {
        sign = exp = mat = 0;
        Get754Value32(b_h1[i] , &sign , &exp , &mat);
    }
    fprintf(fp , "output layer's weight\n");
    for(i=0;i<10;i++)
    {
        for(j=0;j<16;j++)
        {
            sign = exp = mat = 0;
            Get754Value32(w_o[i][j] , &sign , &exp ,&mat);
        }
    }
    fprintf(fp , "output layer's bias\n");
    for(i=0;i<10;i++)
    {
        sign = exp = mat = 0;
        Get754Value32(b_o[i] , &sign , &exp , &mat);
    }
    fclose(fp);
    /*
    // ------------------------------------------------------
    // Get Single Precision Field Value
    float f = -3456.482f, f_mat;
    if( f>65535 ) f = 65535;
    else if( f<-65536 ) f=-65536;
    int sign, exp, ret;
    sign = exp = ret = 0;                  // 清除
    Get754Value32(f, &sign, &exp, &f_mat); // 取得欄位
    printf("%f = -1^%d * %f * 2^%d\n", f, sign, f_mat, exp);
    //-------------------------------------------------------
    // Set Single Precision Field Value
    f = 0.0f, ret = Set754Value32(&f, sign, exp, f_mat); // 設定欄位
    printf("after set value: %f(ret = %d)\n", f, ret);
    */

    return 0;
}

///////////////////////////////////////////////////////////////////
//--------------------------------------------------
// 單精度取得正規化之欄位
void Get754Value32(float v, int *sign, int *exp, float *mat)
{
    float pwr = 0.5f;
    uint value = *(uint *)&v;
    int stop = 0 , temp_exp = 0;
    char s[15];
    *sign = (int)((value & FLT_SIGN_MASK) >> (FLT_MAT_BITS + FLT_EXP_BITS));
    *exp = (int)((value & FLT_EXP_MASK) >> FLT_MAT_BITS) - FLT_BASE_VAL;
    
    temp_exp = *exp;
    fprintf(fp , "parameter coeficent%d = 16'b%d", num , *sign);
    for(int i=0;i<5;i++)
    {
        s[i] = (temp_exp & 1) + '0';
        temp_exp >>= 1;
    }
    for(int i=4;i>=2;i--)
        fprintf(fp , "%c" , s[i]);
    fprintf(fp , "_%c%c" , s[1] , s[0]);
    for(int i=0;i<15;i++) s[i] = '\0';
    
    // calculate mantissa field
    *mat = 1.0f, value <<= (FLT_SIGN_BITS + FLT_EXP_BITS);
    while (value&&stop<10)
    {
        if (value & FLT_SIGN_MASK)
        {
            *mat += pwr;
            s[stop] = '1';
        }
        else 
            s[stop] = '0';
        pwr *= 0.5f;
        value <<= 1;
        stop++;
    }
    fprintf(fp , "%c%c_%c%c%c%c_%c%c%c%c; \n" , s[9] , s[8] , s[7] , s[6] , s[5] , s[4] ,s[3] , s[2] , s[1] , s[0]);
    num++;
}
//--------------------------------------------------
// 單精度正規化數值寫入欄位, 成功傳回,失敗傳
/*int Set754Value32(float *f, int sign, int exp, float mat)
{
    uint *pv = (uint *)f;
    uint m = *(uint *)&mat;
    uint mask = (1U << (23 - 1));

    // error defect
    exp += FLT_BASE_VAL;
    if (exp < 0 || exp >= (1U << FLT_EXP_BITS))
        return 0;
    if (mat >= 2.0f || mat < 1.0f)
        return 0;
    *pv = 0U;

    // set sign and exp
    if (sign)
        *pv |= FLT_SIGN_MASK;
    *pv |= (exp << FLT_MAT_BITS);

    // cal and set mantissa
    mat -= 1.0f;
    while (mask && mat != 0.0f)
    {
        if (mask & m)
            *pv |= mask;
        mat *= 2.0f;
        if (mat > 1.0f)
            mat -= 1.0f;
        mask >>= 1;
    }
    return 1;
}*/
//--------------------------------------------------