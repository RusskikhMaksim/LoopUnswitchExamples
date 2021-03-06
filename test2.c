#include <stdbool.h>
#include <stddef.h>

enum { N = 1024 };

int sum2(int arr[N], bool flag) {
  int result = 1;
  for (size_t i = 0; i < N; i += 2) {
    if (flag) {
      result *= arr[i];
    }

    flag = !flag;
  }
  return result;
}
