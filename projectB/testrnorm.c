#include <stdio.h>
float rnorm(void);
main() {
  float rn;
  int i;
  for (i=0; i<100000; i++) {
    printf("%f\n",rnorm());
  }
}
