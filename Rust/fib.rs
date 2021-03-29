// rustc -O fib.rs

use std::time::Instant;

fn fib_iterative(n: u32) -> u32 {
    let mut a = 0;
    let mut b = 1;
    for _ in 0..n {
        let c = a + b;
        a = b;
        b = c;
    }
    a
}

fn fib_recursive(n: u32) -> u32 {
    if n <= 1 {
        return n;
    }
    fib_recursive(n - 1) + fib_recursive(n - 2)
}

fn main() {
    let now = Instant::now(); // start timer
    println!("{}", fib_recursive(42));
    let elapsed = now.elapsed(); // check time elapsed
    let sec = (elapsed.as_secs() as f64) + (elapsed.subsec_nanos() as f64 / 1_000_000_000.0);
    println!("Seconds Recursive took: {:.3}", sec);

    let now = Instant::now(); // start timer
    println!("{}", fib_iterative(42));
    let elapsed = now.elapsed(); // check time elapsed
    let sec = (elapsed.as_secs() as f64) + (elapsed.subsec_nanos() as f64 / 1_000_000_000.0);
    println!("Seconds Iterative took: {:.3}", sec);
}
