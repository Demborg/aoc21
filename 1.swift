import Foundation

var data: Array<Int> = []
while let rawValue = readLine(strippingNewline: true) {
    if let value = Int(rawValue) {
        data.append(value)
    }
}
print(
    zip(data, data[1...])
        .filter { $1 > $0 }
        .count
)

let smooth = zip(data, zip(data[1...], data[2...]))
    .map { $0 + $1.0 + $1.1 }
print(
    zip(smooth, smooth[1...])
        .filter { $1 > $0 }
        .count
)