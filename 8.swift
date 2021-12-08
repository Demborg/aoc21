var data: [String] = []
while let row = readLine() {
    data.append(row)
}

let split = data
        .map { $0.split(separator: "|").map { $0.split(separator: " ") } }
print(
    split
        .flatMap { $0[1].map {$0.count}.filter {[2, 3, 4, 7].contains($0)}}
        .count
)