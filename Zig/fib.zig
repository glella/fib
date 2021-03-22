// zig build-exe fib.zig -O ReleaseSafe

const std = @import("std");
const time = std.time;
const Timer = time.Timer;
const stdout = std.io.getStdOut().writer();

fn fib_recursive(n: u64) u64 {
    if (n <= 1) return n;
    return fib_recursive(n - 1) + fib_recursive(n - 2);
}

fn fib_iterative(n: u64) u64 {
    var a: u64 = 0;
    var b: u64 = 1;
    var i: u64 = 0;
    while (i < n) : (i += 1) {
        var c = a + b;
        a = b;
        b = c;
    }
    return a;
}

pub fn main() !void {
    var timer = try Timer.start();
    var start = timer.lap();
    try stdout.print("{}\n", .{fib_recursive(42)});
    var end = timer.read();
    var elapsed_s = @intToFloat(f64, end - start) / time.ns_per_s;
    try stdout.print("Recursive took: {:.3}\n", .{elapsed_s});

    timer.reset();
    start = timer.lap();
    try stdout.print("{}\n", .{fib_iterative(42)});
    end = timer.read();
    elapsed_s = @intToFloat(f64, end - start) / time.ns_per_s;
    try stdout.print("Iterative took: {:.3}\n", .{elapsed_s});
}
