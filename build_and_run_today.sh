set -e
DAY=$(date +%-d)
swiftc $DAY.swift
echo "Compliation done"
cat data/$DAY | ./$DAY
