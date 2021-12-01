func printIncreaseCount(in data: Array<Int>) {
    print(
        zip(data, data[1...])
            .filter { $1 > $0 }
            .count
    )
}

var data: Array<Int> = []
while let rawValue = readLine(strippingNewline: true) {
    if let value = Int(rawValue) {
        data.append(value)
    }
}

printIncreaseCount(in: data)

let smooth = zip(data, zip(data[1...], data[2...]))
    .map { $0 + $1.0 + $1.1 }

printIncreaseCount(in: smooth)