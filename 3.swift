import Foundation

var data: Array<Array<Float>> = []
while let rawValue = readLine(strippingNewline: true) {
    var line: Array<Float> = []
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
print(means)
let gamma = means.reversed().enumerated().reduce(0) {$0 + NSDecimalNumber(decimal: pow(2, $1.0)).floatValue * round($1.1)}
let epsilon = NSDecimalNumber(decimal: pow(2, data[0].count)).floatValue - 1 - gamma
print(gamma, epsilon)
print(gamma * epsilon)