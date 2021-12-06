let fish = readLine()!.split(separator:",").map {Int($0)!}
var ages = (0...6).map {age in (age, fish.filter { $0 == age }.count)}

for _ in 0..<256 { 
    ages.append((9, ages.filter {$0.0 == 0}.reduce(0) {$0 + $1.1} ))
    ages = ages.map { ($0.0 > 0 ? $0.0 - 1 : 6, $0.1) }
}

print(ages.reduce(0) {$0 + $1.1})