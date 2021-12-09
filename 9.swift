var heightMap: [[Int]] = []

while let line = readLine() {
    heightMap.append(line.map { Int(String($0))! } )
}

var danger = 0
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
            if xi < 0 || yi < 0 || xi >= line.count || yi >= heightMap.count {
                continue
            }
            minima = minima && element < heightMap[yi][xi]
        }
        if minima {
            danger += element + 1
        }
    }
}

print(danger)