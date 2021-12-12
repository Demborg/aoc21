var caves: [String: [String]] = [:]
while let line = readLine() {
    let cave = line.split(separator: "-").map {String($0)}
    caves[cave[0]] = (caves[cave[0]] ?? []) + [cave[1]]
    caves[cave[1]] = (caves[cave[1]] ?? []) + [cave[0]]
}

func explore(
    _ caves: [String: [String]],
    visited: [String] = [],
    filter: (String, [String]) -> Bool
) -> [[String]] {
    guard let last = visited.last else {
        return explore(caves, visited: ["start"], filter: filter)
    }
    if last == "end" {
        return [visited]
    }
    return (caves[last] ?? [])
        .filter{ filter($0, visited) }
        .flatMap { explore(caves, visited: visited + [$0], filter: filter) }
}

print(
    explore(caves){next, visited in
        !visited.filter{ $0.lowercased() == $0 }.contains(next)
    }.count
)

print(
    explore(caves){next, visited in
        if next == "start" { return false }
        let counts = Dictionary(
            grouping: visited.filter{ $0.lowercased() == $0 },
            by: {$0}
        ).mapValues {$0.count}
        if (counts.reduce(true) {$0 && $1.value  < 2}) {
            return true
        }
        return counts[next] == nil
    }.count
)