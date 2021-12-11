var octopuses: [[(value: Int, flashed: Bool)]] = []

while let line = readLine() {
    octopuses.append(line.map {(value: Int(String($0))!, flashed: false)})
}

var flashes = 0
for _ in 0..<100 {
    octopuses = octopuses.map { line in line.map {(value: $0.value + 1, flashed: false)} }
    while (octopuses.flatMap{$0}.filter {$0.value > 9}.count > 0) {
        for yThing in octopuses.enumerated() {
            for xThing in yThing.1.enumerated() {
                if xThing.1.value > 9 {
                    flashes+=1
                    octopuses[yThing.0][xThing.0] = (value: 0, flashed: true)
                    for yi in (yThing.0 - 1)...(yThing.0 + 1) {
                        for xi in (xThing.0 - 1)...(xThing.0 + 1) {
                            if (yi != yThing.0 || xi != xThing.0) && (0..<octopuses.count).contains(yi) && (0..<octopuses[0].count).contains(xi) && !octopuses[yi][xi].flashed {
                                octopuses[yi][xi].value += 1
                            }
                        }
                    }
                }
            }
        }
    }
}

print(flashes)