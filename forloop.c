#include<stdio.h>

int main(void)
{
  int par = 0;
  int n = 0;

  for(int i=10, i>n, i--)
  {
    par = par +2;
    printf("%d \n",par);
  }
}


initelement(par).
type(par,int).
initelement(n).
type(n,int).
initelement(i).
type(i,int).
condst(for_1,i,<,n).
location(for_1,main).
insielement(for_1,par).
increase(for_1,par).
insielement(for_1,i).
decrease(for_1,i).
linest(for_1).
