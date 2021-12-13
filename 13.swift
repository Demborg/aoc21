var dots: [[Int]] = []
var folds: [(dir: Int, cord: Int)] = []

while let line = readLine() {
    if line.count == 0 {
        continue
    }
    if line.first! == "f" {
        let fold = line.dropFirst("fold along ".count).split(separator: "=")
        folds.append((dir: fold[0] == "x" ? 0 : 1, Int(fold[1])!))
    } else if line.count > 0 {
        dots.append(line.split(separator: ",").map {Int($0)!})
    }
}

func fold(_ dots: [[Int]], with fold: (dir: Int, cord: Int)) -> [[Int]] {
    return Dictionary(
        grouping: dots.map {dot in
            dot.enumerated().map {
                $0.0 == fold.dir ? ($0.1 > fold.cord ? 2 * fold.cord - $0.1 : $0.1): $0.1
            } 
        },
        by: {$0}
    ).map {$0.key}
}

print(fold(dots, with: folds.first!).count)

dots = folds.reduce(dots) {dots, f in fold(dots, with: f)}
print(
    (0...dots.reduce(0) {max($0, $1[1])})
        .map {y in 
            (0...dots.reduce(0) {max($0, $1[0])})
                .map {x in 
                    dots.contains([x, y]) ? "#" : " "
                }.joined(separator: "")
        }.joined(separator: "\n")
)