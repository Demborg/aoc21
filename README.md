# Advent of Code 2021
This year I will try to get as many of the problems as possible done in Swift

## Thoughts and questions for someone smarter than me
* Day1 I wanted a `windowed reduce` function or similar, was trying to make this as an extension for the Array<T>
but couldn't get it working, are templated extension not a thing?
* More of a complaint than anything else but gee exponentiation in this lagnuage is uggly
`NSDecimalNumber(decimal: pow(2, 4)).floatValue` (and it requires Foundation import) is there nothing nicer if I 
know it will fit in a double?
* Should not have been surprised by this but evaluation order for ints is can bit you `(4 / 3 * 12) != (4 * 12 / 3)`