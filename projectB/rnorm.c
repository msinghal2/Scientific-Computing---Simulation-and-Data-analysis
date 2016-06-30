/* Calculate a normally distributed random number */
/* mean=0, sd=1, using the Box-Muller method */
#include <math.h>
#include <stdlib.h>
#include <time.h>
float rnorm(void) {
  static int initial=1;
  float a,b,r1,r2;
  if (initial) {  
      srand(time(NULL));
      initial=0;
  }
  a=rand()/(double)RAND_MAX;    
  b=rand()/(double)RAND_MAX;    
  r1=sqrt(-2.*log(a))*cos(2.*M_PI*b);
  /* For second random number use formula */
  /* r2=sqrt(-2.*log(a))*sin(2.*M_PI*b); */
  return r1;
}


  
