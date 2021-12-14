let template = readLine()!

var rules: [String: Character] = [:]
while let line = readLine() {
    if line.count == 0 { continue }
    let parts = line.split(separator: " ")
    rules[String(parts[0])] = parts[2].first!
}

let polymer = (0..<10).reduce(template) {polymer, _ in
    zip(polymer, polymer.dropFirst())
        .map {
            if let mid = rules["\($0.0)\($0.1)"] {
                return "\($0.0)\(mid)"
            }
            return "\($0.0)"
        }
        .joined(separator: "") + "\(polymer.last!)"
}

let counts = Dictionary(grouping: polymer, by: {$0}).mapValues{$0.count}
print(counts.values.max()! - counts.values.min()!)