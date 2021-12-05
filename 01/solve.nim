import std/sequtils
import std/strutils

proc problem1(depths: seq[int]): int =
    var count = 0
    for i in 1..high(depths):
        if depths[i] > depths[i-1]:
            count += 1
    return count

proc problem2(depths: seq[int]): int =
    var count = 0
    for i in 3..high(depths):
        # just check boundaries
        # a1 + a2 + a3 > a2 + a3 + a4 = a1 > a4
        if depths[i] > depths[i-3]:
            count += 1
    return count

when isMainModule:
    let lines = splitLines(strip(readFile("input.txt")))
    let linesInt = map(lines, parseInt)
    echo problem1(linesInt)
    echo problem2(linesInt)
