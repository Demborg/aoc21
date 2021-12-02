
var data: Array<(Int, Int)> = []
while let rawValue = readLine(strippingNewline: true) {
    let split = rawValue.split(separator: " ")
    print(split)
    if let amount = Int(split[1]) {
        if split[0].first == "f" {
            data.append((amount, 0))
        }
        if split[0].first == "u" {
            data.append((0, -amount))
        }
        if split[0].first == "d" {
            data.append((0, amount))
        }
    }
}

let res = data.reduce((0, 0), {first, second in (first.0 + second.0, first.1 + second.1)})
print(res.0 * res.1)