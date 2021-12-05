import std/sequtils
import std/strutils
import std/enumerate
import std/sugar

type 
    BingoBoard = seq[int]

const SIDE = 15
func fromString(repr: string): BingoBoard =
    var board: BingoBoard = newSeq[int](SIDE*SIDE)
    for i, line in enumerate(repr.split("\n")):
        for j, num in enumerate(line.splitWhitespace().map(parseInt)):
            board[SIDE*i+j] = num 
    return board

func isBingo(board: BingoBoard): bool =
    for row in toSeq(0..<SIDE):
        var row = row
        if toSeq(0..<SIDE).all((col) => board[row*SIDE+col] == -1):
            return true
    for col in toSeq(0..<SIDE):
        var col = col
        if toSeq(0..<SIDE).all((row) => board[row*SIDE+col] == -1):
            return true
    return false

func problem1(draws: seq[int], boards: var seq[BingoBoard]): int =
    for draw in draws:
        var draw = draw
        for i in 0..high(boards):
            boards[i] = boards[i].map((x) => (if x == draw: -1 else: x))
            if isBingo(boards[i]):
                return draw*boards[i].filter((x) => x != -1).foldl(a + b)

func problem2(draws: seq[int], boards: var seq[BingoBoard]): int =
    var lastScore = 0
    for draw in draws:
        var draw = draw
        boards = boards.filter((b) => not isBingo(b))
        for i in 0..high(boards):
            boards[i] = boards[i].map((x) => (if x == draw: -1 else: x))
            if isBingo(boards[i]):
                lastScore = draw*boards[i].filter((x) => x != -1).foldl(a + b, 0)
    return lastScore

when isMainModule:
    let content = readFile("input_big.txt").strip()
    var parts = content.split("\n\n", 1)
    var draws = parts[0].split(",").map(parseInt)
    var boards: seq[BingoBoard] = parts[1].split("\n\n").map(fromString)
    echo problem1(draws, boards)
    echo problem2(draws, boards)