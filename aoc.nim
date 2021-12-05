import std/os
import std/times
import std/strutils
import std/strformat
import std/httpclient

let client = newHttpClient(headers=newHttpHeaders({ "Cookie": strip(readFile("cookies.txt")) }))
let year = 2021

proc setupDay(day: int, root: string): string =
    let inputContent = client.getContent(&"https://adventofcode.com/{year}/day/{day}/input")
    let dir = &"{root}/{day:02}"
    if not dirExists(dir):
        createDir(dir)
        copyFile(&"{root}/solve_template.nim", &"{dir}/solve.nim")
        writeFile(&"{dir}/input.txt", inputContent)
    return dir


when isMainModule:
    var day: int
    if paramCount() > 0:
        day = parseInt(paramStr(1))
    else:
        let today = now()
        day = today.monthday
    let dir = setupDay(day, getCurrentDir())
    echo &"Day {day} setup in {dir}"
