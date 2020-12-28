
enum { N = 1024 };

int sum2(int arr[N], int flag) {
  int result = 1;
  for (int i = 0; i < N; i += 2) {
    if (flag) {
      result *= arr[i];
    }
  }
  return result;
}

