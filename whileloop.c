#include<stdio.h>

int main(void)
{
  int par=0;
  int cont=0;
  int n=10;

  while(cont<n)
  {

    par = par+2;
    printf("%d \n",par);
    cont++;
  }
}

initelement(par).
type(par,int).
initelement(cont).
type(cont,int).
inielement(n).
type(n,int).
condst(while_1,cont,<,n).
location(while_1,main).
insielement(while_1,par).
increase(while_1,par).
insielement(while_1,cont).
increase(while_1,cont).
linest(while_1).
