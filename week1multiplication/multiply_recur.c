#include <stdio.h>
#include <stdlib.h>
#include <inttypes.h>

long long int multiply(long long int int1, long long int int2);

int main (int argc, char* argv[]){
  if(argc != 3){
    printf("Usage: ./multiply int1 int2");
    return 1;
  }
  long long int  num1 = atoi(argv[1]);
  long long int  num2 = atoi(argv[2]);

  long long int  answer = multiply(num1,num2);

  printf("%lld * %lld is equal to %lld \n",num1,num2,answer);
  return 0;
}

long long int multiply(long long int  int1, long long int  int2){
  if(int2 == 1){
    return int1;
  }
  else{
    return int1 + multiply(int1, int2 - 1);
  }
}
