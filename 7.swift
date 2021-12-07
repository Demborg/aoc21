let crabs = readLine()!.split(separator:",").map {Int($0)!}
print(
    (0...crabs.max()!)
        .map {crabs.reduce(($0, 0)) { ($0.0, $0.1 + abs($1 - $0.0)) }.1 }
        .min()!
)