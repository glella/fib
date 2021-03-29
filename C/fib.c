// clang -O3 fib.c -o fib

#include <stdio.h>
#include <stdint.h>
#import <time.h>

uint64_t fib_recursive(uint64_t n) {
	if (n <= 1) return n;
	return fib_recursive(n - 1) + fib_recursive(n - 2);
}

uint64_t fib_iterative(uint64_t n) {
	uint64_t a = 0;
	uint64_t b = 1;
	for (int i = 0; i < n; i++) {
		uint64_t c = a + b;
		a = b;
		b = c;
	}
	return a;
}

int main(void) {
	clock_t     start, end;
	double      r;

	start = clock(); // start the clock
	printf("%llu \n", fib_recursive(42));
	end = clock(); // stop the clock
    r = ((double)(end-start)) / ((double)(CLOCKS_PER_SEC));
    printf("Recursive took %.3f Seconds.\n", r);

    start = clock(); // start the clock
	printf("%llu \n", fib_iterative(42));
	end = clock(); // stop the clock
    r = ((double)(end-start)) / ((double)(CLOCKS_PER_SEC));
    printf("Iterative took %.3f Seconds.\n", r);

	return 0;
}