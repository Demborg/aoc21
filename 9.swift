var heightMap: [[Int]] = []

while let line = readLine() {
    heightMap.append(line.map { Int(String($0))! } )
}

var lowPoints: [(x: Int, y: Int, value: Int)] = []
for row in heightMap.enumerated() {
    let y = row.0
    let line = row.1
    for cell in line.enumerated() {
        let x = cell.0
        let element = cell.1
        var minima = true
        for offsets in [(y - 1, x), (y + 1, x), (y, x - 1), (y, x + 1)] {
            let xi = offsets.1
            let yi = offsets.0
            if (0..<line.count).contains(xi) && (0..<heightMap.count).contains(yi){
                minima = minima && element < heightMap[yi][xi]
            }
        }
        if minima {
            lowPoints.append((x: x, y: y, value: element))
        }
    }
}
print(lowPoints.reduce(0) {$0 + $1.value + 1})

var lakes: [Int] = []
for point in lowPoints {
    var ridges = heightMap.map {$0.map { value -> Bool? in value == 9 ? nil : false}}
    ridges[point.y][point.x] = true
    var count = 0
    while (count != ridges.reduce(0) {$0 + $1.reduce(0) {$0 + ($1 ?? false ? 1 : 0)}}) {
        count = ridges.reduce(0) {$0 + $1.reduce(0) {$0 + ($1 ?? false ? 1 : 0)}}
        for row in ridges.enumerated() {
            let y = row.0
            let line = row.1
            for cell in line.enumerated() {
                let x = cell.0
                let element = cell.1
                var member = false
                for offsets in [(y - 1, x), (y + 1, x), (y, x - 1), (y, x + 1)] {
                    let xi = offsets.1
                    let yi = offsets.0
                    if (0..<line.count).contains(xi) && (0..<heightMap.count).contains(yi){
                        if let other = ridges[yi][xi], let _ = element {
                            member = member || other
                        }
                    }
                }
                if member {
                    ridges[y][x] = true
                }
            }
        }
    }
    lakes.append(count)
}
print(lakes.sorted().suffix(3).reduce(1, *))