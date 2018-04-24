int par=0;            //extra variable to show the while loop does something

int cont=5;           // these are the the prerequisites for while: P
int n=15;

while(cont<n)         // inside you have the condition B that is true at the start
{
  if (cont%2==0)      // this is the execution part: {Q}
  {
    par++;
  }

  cont++;
                    //this variable will make B to be false
}
                    // in the post execution you need to show that B is false
                    // and to show that P is still true after execution of {Q}
