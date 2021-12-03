import Foundation

typealias Row = Array<Float>

func float(from row: Row) -> Float {
    row
        .reversed()
        .enumerated()
        .reduce(0) {
            $0 + NSDecimalNumber(decimal: pow(2, $1.0)).floatValue * round($1.1)
        }
}

var data: Array<Row> = []
while let rawValue = readLine(strippingNewline: true) {
    var line: Row = []
    for char in rawValue {
        line.append(char == "1" ? 1 : 0)
    }
    data.append(line)
}

let means = data
    .reduce([Float](repeating: 0, count: data[0].count)) {counts, line in 
        zip(counts, line).map { $0 + $1 }
    }
    .map { $0 / Float(data.count) }
let gamma = float(from: means)
let epsilon = NSDecimalNumber(decimal: pow(2, data[0].count)).floatValue - 1 - gamma
print(gamma * epsilon)

func getRating(in data: Array<Row>, max: Bool, index: Int = 0) -> Row {
    if data.count == 1 {
        return data[0]
    }
    let mostCommon = round(data.reduce(0) { $0 + $1[index] } / Float(data.count))
    return getRating(
        in: data.filter { $0[index] == (max ? mostCommon : 1 - mostCommon) },
        max: max,
        index: index+1
    )
}

print([true, false].map { float(from: getRating(in: data, max: $0)) }.reduce(1, *))