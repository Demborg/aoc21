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