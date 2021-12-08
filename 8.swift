var data: [String] = []
let easy = [1: 2, 7: 3, 4: 4, 8: 7]
while let row = readLine() {
    data.append(row)
}

let split = data
        .map { $0.split(separator: "|").map { $0.split(separator: " ") } }
print(
    split
        .flatMap { $0[1].map {$0.count}.filter {easy.values.contains($0)}}
        .count
)

func translate(_ code: String, using dict: [Int: String]) -> Int {
    switch code.count {
    case 2:
        return 1
    case 3:
        return 7
    case 4:
        return 4
    case 5:
        if code.filter {dict[1]!.contains($0)}.count == 2 {
            return 3
        }
        if code.filter {symbol in dict[4]!.filter {!dict[1]!.contains($0)}.contains(symbol)}.count == 2 {
            return 5
        }
        return 2
    case 6:
        if code.filter {dict[1]!.contains($0)}.count == 1 {
            return 6
        }
        if code.filter {dict[4]!.contains($0)}.count == 4 {
            return 9
        }
        return 0
    default:
        return 8
    }
}

let asd = split
    .map { row in
        (
            Dictionary(uniqueKeysWithValues:
                easy.map {element in
                    (element.key, String(row[0].first {$0.count == element.value}!))
                }
            ),
            row[1]
        )
    }

print(
    asd
        .map { thing in 
            thing.1.map {translate(String($0), using: thing.0)}
        }
        .map {
            Int(
                $0
                    .map {String($0)}
                    .joined(separator: "")
            )!
        }
        .reduce(0, +)
)