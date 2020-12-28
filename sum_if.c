#include <stdbool.h>
#include <stddef.h>

enum { N = 1024 };

int sum2(int arr[N], bool flag) {
  int result = 1;
  for (size_t i = 0; i < N; i += 2) {
    if (flag) {
      result *= arr[i];
    }
  }
  return result;
}

/*


				int a = 10;
				
				float x = 0;
				for(int i = 0; i < 1000; i++){
				  x = 2 * a;
				  //something 
				}



				int a = 10;

				float x = 2 * a;
				for(int i = 0; i < 1000; i++){
				 
				  //something 
				}




				int x = 0;
				for(int i = 0; i < 1000; i++) {
				  x += 1;				
				  if(flag) {
				    //something				
				  }

				x *= 2;			
				} 

*/











