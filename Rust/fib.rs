// Iterative & Recursive solutions
// rustc -O fib.rs
use std::time::Instant;

// use std::io;
// use std::io::Write; // <--- bring flush() into scope

// fn prompt(s: &str) -> String {
//     print!("{}", s);
//     io::stdout().flush().unwrap(); // flush it to the screen

//     let mut text = String::new();
//     io::stdin()
//         .read_line(&mut text)
//         .expect("failed to read from stdin");
//     text.trim().to_string()
// }

// fn get_int(s: &str) -> u32 {
//     let mut n = 0;
//     match s.parse::<u32>() {
//         Ok(i) => n = i,
//         Err(..) => println!("That was not an integer."),
//     };
//     n
// }

fn fib_iterative(n: u64) -> u64 {
    let mut a = 0;
    let mut b = 1;
    for _ in 0..n {
        let c = a + b;
        a = b;
        b = c;
    }
    a
}

fn fib_recursive(n: u64) -> u64 {
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

    // Test: Ask for user input to reconfirm we avoid optimization at compile time
    // let input = prompt("Fib number? ");
    // let num = get_int(&input) as u64;

    let now = Instant::now(); // start timer
    println!("{}", fib_iterative(42));
    let elapsed = now.elapsed(); // check time elapsed
    let sec = (elapsed.as_secs() as f64) + (elapsed.subsec_nanos() as f64 / 1_000_000_000.0);
    println!("Seconds Iterative took: {:.3}", sec);
}
