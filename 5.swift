import Foundation

func twoTuple<T>(from array: [T]) -> (T, T) {
    (array[0], array[1])
}

func unDirectionalRange(_ start: Int, _ stop: Int) -> ClosedRange<Int> {
    return min(start, stop)...max(start, stop)
}

struct Point : Hashable {
    let x: Int
    let y: Int

    static func == (lhs: Point, rhs: Point) -> Bool {
        return lhs.x == rhs.x && lhs.y == rhs.y
    }

    func hash(into hasher: inout Hasher) {
        hasher.combine(x)
        hasher.combine(y)
    }
}

var rawLines: [String] = []
while let rawLine = readLine() {
    rawLines.append(rawLine)
}

let allLines = rawLines
    .map {
        twoTuple(from:$0.components(separatedBy: " -> ").map {
            twoTuple(from: $0.split(separator: ",").map { Int($0)! })
        })
    }

let points = allLines
    .filter { line in line.0.0 == line.1.0 || line.0.1 == line.1.1}
    .flatMap { line -> [(Int, Int)] in
        if line.0.0 == line.1.0 {
            return unDirectionalRange(line.0.1, line.1.1).map {(line.0.0, $0)}
        }
        return unDirectionalRange(line.0.0, line.1.0).map {($0, line.0.1)}
    }
    .map { Point(x: $0.0, y: $0.1) }

var counts: [Point: Int] = [:] 
for p in points {
    counts[p] = (counts[p] ?? 0) + 1
}

print(counts.filter {$0.value > 1}.count)