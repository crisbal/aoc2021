import std/sequtils
import std/strutils

proc problem1(lines: seq[string]): int =
    var hor = 0
    var ver = 0
    for line in lines:
        let parts = line.split(" ")
        let move = parts[0]
        let amount = parseInt(parts[1])
        if move.startsWith("f"):
            hor += amount
        elif move.startsWith("d"):
            ver += amount
        elif move.startsWith("u"):
            ver -= amount
    return hor*ver

proc problem2(lines: seq[string]): int =
    var hor = 0
    var ver = 0
    var aim = 0
    for line in lines:
        let parts = line.split(" ")
        let move = parts[0]
        let amount = parseInt(parts[1])
        if move.startsWith("f"):
            hor += amount
            ver += amount*aim
        elif move.startsWith("d"):
            aim += amount
        elif move.startsWith("u"):
            aim -= amount
    return hor*ver

when isMainModule:
    let lines = splitLines(strip(readFile("input.txt")))
    echo problem1(lines)
    echo problem2(lines)
