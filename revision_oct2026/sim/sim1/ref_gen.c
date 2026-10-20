// ascon-c reference (asconaead128/ref) driver: ref_gen adlen ptlen outprefix
// writes <p>_ad.hex <p>_pt.hex <p>_exp.hex (CT||TAG, 1 byte/line); checks ref decrypt (good tag -> 0, flipped tag bit -> nonzero)
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include "api.h"
#include "crypto_aead.h"
static void dump(const char*f,const unsigned char*b,size_t n){FILE*o=fopen(f,"w");if(!n)fprintf(o,"00\n");for(size_t i=0;i<n;i++)fprintf(o,"%02x\n",b[i]);fclose(o);}
int main(int c,char**v){
  size_t a=atoi(v[1]),p=atoi(v[2]); char fn[256];
  unsigned char k[16],n[16],*ad=malloc(a+1),*pt=malloc(p+1),*ct=malloc(p+32),*dp=malloc(p+32);
  for(int i=0;i<16;i++){k[i]=i;n[i]=16+i;}
  for(size_t i=0;i<a;i++)ad[i]=(0x30+i)&255; for(size_t i=0;i<p;i++)pt[i]=(0x20+i)&255;
  unsigned long long cl,ml;
  crypto_aead_encrypt(ct,&cl,pt,p,ad,a,NULL,n,k);
  sprintf(fn,"%s_ad.hex",v[3]);dump(fn,ad,a); sprintf(fn,"%s_pt.hex",v[3]);dump(fn,pt,p); sprintf(fn,"%s_exp.hex",v[3]);dump(fn,ct,cl);
  int r1=crypto_aead_decrypt(dp,&ml,NULL,ct,cl,ad,a,n,k);
  ct[cl-16]^=1; int r2=crypto_aead_decrypt(dp,&ml,NULL,ct,cl,ad,a,n,k);
  printf("ref: encrypt clen=%llu ; decrypt(good tag) rc=%d ; decrypt(tag bit0 flipped) rc=%d\n",cl,r1,r2);
  return 0;}
