set -e
DAY=$(date +%-d)
swiftc $DAY.swift
cat data/$DAY | ./$DAY
