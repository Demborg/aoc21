let closing: [Character: Character] = ["(": ")", "[": "]", "{": "}", "<": ">"]
let scores: [Character: (Int, Int)] = [")": (3, 1), "]": (57, 2), "}": (1197, 3), ">": (25137, 4)]

var lines: [String] = []
while let line = readLine() {
    lines.append(line)
}

let fails = lines.map {line -> (Int?, Int?) in
    var thing: [Character] = []
    for c in line {
        if "([{<".contains(c) {
            thing.append(c)
        } else if closing[thing.last!]! == c {
            thing.removeLast()
        } else {
            return (scores[c]?.0, nil)
        }
    }
    return (nil, thing.map{scores[closing[$0]!]!.1}.reversed().reduce(0) {5 * $0 + $1})
}

print(fails.compactMap{$0.0}.reduce(0,+))
let completionScores = fails.compactMap{$0.1}.sorted()
print(completionScores[completionScores.count / 2])
