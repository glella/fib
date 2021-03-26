//v -autofree fib.v
import time

fn fib_recursive(n u64) u64 {
    if n <= 1 {
        return n
    }
    return fib_recursive(n - 1) + fib_recursive(n - 2)
}

fn fib_iterative(n u64) u64 {
    mut a := u64(0)
    mut b := u64(1)
    for _ in 0 .. n {
        c := a + b
        a, b = b, c
    }
    return a
}

fn main() {
    sw := time.new_stopwatch({})
    println(fib_recursive(42))
    mut elapsed := f64(sw.elapsed().microseconds()) / 1_000_000.0
    println('Recursive took: ${elapsed:.3f} secs.')

    sw2 := time.new_stopwatch({})
    println(fib_iterative(42))
    elapsed = f64(sw2.elapsed().microseconds()) / 1_000_000.0
    println('Iterative took: ${elapsed:.3f} secs.')
}