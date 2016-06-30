#include<stdio.h>
#include<stdlib.h>
float rnorm(void);
int main(void) {
	int i, j, k, m, n, ntrials=5000, N=200;
	float *array, a, avgmax;
	array=(float*)malloc(N*sizeof(float));
	for(k=1; k<=N; k++) {
		
		float sum=0.0;
		for(j=0; j<ntrials; j++) {
			for(i=0; i<k; i++) {

				array[i]=rnorm();
				
			}

//sorting the array			
			for(m=0; m<k; m++) {
				for(n=m+1; n<k; n++) {
					if(array[m]>array[n]) {
						a=array[m];
						array[m]=array[n];
						array[n]=a;
					}
				}
			}
//array sorted	

			sum+=array[k-1];
		}
		avgmax=sum/(float)ntrials;
		printf("N= %d  Avg max.val= %f\n",k,avgmax);
	}	
	free(array);					
}				
			
