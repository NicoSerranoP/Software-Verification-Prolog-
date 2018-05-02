#include<stdio.h>

int main(void)
{
  int array[] = {1,1,2,3,5,8,13,21,34};
  int other[50];
  int n = 9;
  int e = 0;

  for(int i = 0; i<n ; i++)
  {
    if (array[i] < 10)
    {
      array[i] = 0;
    }

    else
    {
      array[i] = 1;
    }
  }

  while(e < n)
  {
    printf("%d \n",array[e]);
    e++;
  }

}
