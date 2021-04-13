#nim c -d:release fib.nim
#optionally: nim c -d:danger fib.nim
import times, strutils

proc fib_recursive(n: int): int = 
    if n <= 1:
        return n
    return fib_recursive(n-1) + fib_recursive(n-2)


proc fib_iterative(n: int): int =
    var a = 0
    var b = 1
    for i in 0 ..< n:
        let c = a + b
        a = b
        b = c
    return a

template benchmark(benchmarkName: string, code: untyped) =
    let t0 = epochTime()
    code
    let elapsed = epochTime() - t0
    let elapsedStr = elapsed.formatFloat(format = ffDecimal, precision = 3)
    echo "Seconds [", benchmarkName, "] ", elapsedStr

benchmark "Recursive":
    echo(fib_recursive(42))

benchmark "Iterative":
    echo(fib_iterative(42))

