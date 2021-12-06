var fish = readLine()!.split(separator:",").map {Int($0)!}

for day in 0..<80 {
    fish.append(contentsOf: [Int](repeating: 9, count:fish.filter {$0 == 0}.count))
    fish = fish.map {$0 > 0 ? $0 - 1 : 6}
}
print(fish.count)