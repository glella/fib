// go build fib.go

package main

import (
	"fmt"
	"time"
)

func fib_recursive(n uint64) uint64 {
	if n <= 1 {
		return n
	}
	return fib_recursive(n-1) + fib_recursive(n-2)
}

func fib_iterative(n int) int {
	a := 0
	b := 1
	for i := 1; i <= n; i++ {
		c := a + b
		a, b = b, c
	}
	return a
}

func main() {
	start := time.Now() // Start timer
	fmt.Println(fib_recursive(42))
	duration := time.Since(start) // End timer & duration
	elapsed := float64(duration) / float64(time.Millisecond)
	elapsed = elapsed / 1000.0
	fmt.Printf("Recursive took secs: %.3f\n", elapsed)

	start = time.Now() // Start timer
	fmt.Println(fib_iterative(42))
	duration = time.Since(start) // End timer & duration
	elapsed = float64(duration) / float64(time.Millisecond)
	elapsed = elapsed / 1000.0
	fmt.Printf("Iterative took secs: %.3f\n", elapsed)

}
