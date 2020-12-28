
enum { N = 1024 };

int sum2(int arr[N], int flag) {
  int result = 1;
  int condition = 0;
  for (int i = 0; i < N; i += 2) {
    result *= 3;
    if (flag) {
      result *= arr[i];
      
    }
   
    result += 1;
  }
  return result;
}
