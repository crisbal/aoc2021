import std/sequtils
import std/strutils
import std/sugar
import std/enumerate
import std/math

proc problem1(lines: seq[string]): int =
    let n_rows = len(lines)
    let n_cols = len(lines[0])
    var ones = newSeq[int](n_cols)
    for line in lines:
        for i, bitchar in enumerate(line):
            if bitchar == '1':
                ones[i] += 1
    var gr = newSeq[int](n_cols)
    var er = newSeq[int](n_cols)
    for i in 0..<n_cols:
        gr[i] = (if ones[i] > int(n_rows/2): 1 else: 0)
        er[i] = (if ones[i] > int(n_rows/2): 0 else: 1)
    
    var gr_int = 0
    var er_int = 0
    for i in countdown(n_cols-1, 0):
        gr_int = gr_int + gr[i] * 2^(n_cols-1-i)
        er_int = er_int + er[i] * 2^(n_cols-1-i)
    echo gr
    echo gr_int
    return gr_int*er_int

proc problem2(): int =
    return 2

when isMainModule:
    let lines = splitLines(strip(readFile("input.txt")))
    # let linesInt = map(lines, parseInt)
    echo problem1(lines)
    echo problem2()
