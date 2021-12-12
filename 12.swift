var caves: [String: [String]] = [:]
while let line = readLine() {
    let cave = line.split(separator: "-").map {String($0)}
    caves[cave[0]] = (caves[cave[0]] ?? []) + [cave[1]]
    caves[cave[1]] = (caves[cave[1]] ?? []) + [cave[0]]
}

func explore(_ caves: [String: [String]], visited: [String] = []) -> [[String]] {
    guard let last = visited.last else {
        return explore(caves, visited: ["start"])
    }
    if last == "end" {
        return [visited]
    }
    return (caves[last] ?? [])
        .filter {next in !visited.filter{ $0.lowercased() == $0 }.contains(next) }
        .flatMap { explore(caves, visited: visited + [$0]) }
}

print(explore(caves).count)