import Foundation

func twoTuple<T>(from array: [T]) -> (T, T) {
    (array[0], array[1])
}

func lineToPoints(line: ((Int, Int), (Int, Int))) -> [Point] {
    let steps = max(abs(line.0.0 - line.1.0), abs(line.0.1 - line.1.1))
    let points = (0...steps)
        .map {
            Point(
                x: line.0.0 + $0 * (line.1.0 - line.0.0) / steps,
                y: line.0.1 + $0 * (line.1.1 - line.0.1) / steps
            )
        }
    return points
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
    // .filter { line in line.0.0 == line.1.0 || line.0.1 == line.1.1}
    .flatMap(lineToPoints)

var counts: [Point: Int] = [:] 
for p in points {
    counts[p] = (counts[p] ?? 0) + 1
}

print(counts.filter {$0.value > 1}.count)