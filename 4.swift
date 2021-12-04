import Foundation

let input = readLine()!.split(separator: ",").map {Int($0)!} 

var boardStrings = ""
while let line = readLine(strippingNewline: false) {
    boardStrings += line
}

let boards = boardStrings
    .components(separatedBy: "\n\n")
    .map { board in 
        board
            .split(separator: "\n")
            .map { row in
                row
                    .split(separator: " ")
                    .map {Int($0)!}}
    }

let winningBoards = (0...input.count-1)
    .map {input[0...$0]}
    .map {partial in 
        boards.filter { board in 
            board.reduce(false) {win, row in win || row.count == row.filter {partial.contains($0)}.count}
            || (0...board.count-1).reduce(false) {win, index in win || board.count == board.map {row in row[index]}.filter {partial.contains($0)}.count}
        }.map { ($0, partial) }
    }
    .filter {$0.count > 0}

print(winningBoards.first!.map {board, partial in board.reduce(0) { $0 + $1.filter { !partial.contains($0) }.reduce(0, +) } * partial.last! })