let crabs = readLine()!.split(separator:",").map {Int($0)!}
print(
    [abs, {abs($0) * (abs($0) + 1 ) / 2}]
        .map { cost in 
            (0...crabs.max()!)
                .map {alignPosition in
                    crabs.reduce(0) { $0 + cost($1 - alignPosition) }
                }.min()!
        }
)