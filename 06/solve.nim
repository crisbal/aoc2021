import std/sequtils
import std/strutils
import std/tables

proc problem(fishes: seq[int], days: int): int =
    var fishes = toCountTable(fishes)
    for day in 1..days:
        for age in 0..8:
            fishes[age-1] = fishes[age]
        fishes[8] = fishes[-1]
        fishes[6] = fishes[6] + fishes[-1]
        fishes[-1] = 0
    return toSeq(values(fishes)).foldl(a+b)

when isMainModule:
    let fishes = strip(readFile("input.txt")).split(",").map(parseInt)
    echo problem(fishes, 80)
    echo problem(fishes, 256)
