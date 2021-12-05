import std/sequtils
import std/strutils

proc problem1(): int =
    return 1

proc problem2(): int =
    return 2

when isMainModule:
    let lines = splitLines(strip(readFile("input.txt")))
    let linesInt = map(lines, parseInt)
    echo problem1()
    echo problem2()
