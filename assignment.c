#include<stdio.h>

int main (void)
{
  int a = 3;
  int b = 5;

  a = b;
}

initelement(a).
type(a,int).
inielement(b).
type(b,int).
assignst(assign_1,a,=,b).
location(assign_1,main).
