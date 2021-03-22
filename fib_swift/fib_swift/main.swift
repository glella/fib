//
//  main.swift
//  fib_swift
//
//  Created by Guillermo Lella on 3/21/21.
//

import Foundation

func fib_recursive(n: Int) -> Int {
  if n <= 1 { return n }
  return (fib_recursive(n: n &- 1) &+ fib_recursive(n: n &- 2))
}

func fib_iterative(n: Int) -> Int {
    var a = 0
    var b = 1
    for _ in 0..<n {
        let c = a + b
        a = b
        b = c
    }
    return a
}

var start = DispatchTime.now() // <<<<<<<<<< Start time
print(fib_recursive(n: 42))
var end = DispatchTime.now()   // <<<<<<<<<<   end time
var nanoTime = end.uptimeNanoseconds - start.uptimeNanoseconds // <<<<< Difference in nano seconds (UInt64)
var timeInterval = Double(nanoTime) / 1_000_000_000 // Technically could overflow for long running tests
print("Recursive took: \(String(format: "%.3f", timeInterval)) secs")

start = DispatchTime.now() // <<<<<<<<<< Start time
print(fib_iterative(n: 42))
end = DispatchTime.now()   // <<<<<<<<<<   end time
nanoTime = end.uptimeNanoseconds - start.uptimeNanoseconds // <<<<< Difference in nano seconds (UInt64)
timeInterval = Double(nanoTime) / 1_000_000_000 // Technically could overflow for long running tests
print("Iterative took: \(String(format: "%.3f", timeInterval)) secs")

