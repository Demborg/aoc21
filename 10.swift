let closing: [Character: Character] = ["(": ")", "[": "]", "{": "}", "<": ">"]
let scores: [Character: Int] = [")": 3, "]": 57, "}": 1197, ">": 25137]

var lines: [String] = []
while let line = readLine() {
    lines.append(line)
}

let fails = lines.compactMap {line -> Character? in
    var thing: [Character] = []
    for c in line {
        if "([{<".contains(c) {
            thing.append(c)
        } else if closing[thing.last!]! == c {
            thing.removeLast()
        } else {
            return c
        }
    }
    return nil
}

print(fails.reduce(0) { $0 + scores[$1]! })
