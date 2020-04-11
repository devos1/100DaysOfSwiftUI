import UIKit

// Arrays are Structs
var toys = ["Woody"]

print(toys.count)

toys.append("Buzz")
print(toys)
toys.firstIndex(of: "Buzz")
print(toys.sorted())
toys.remove(at: 0)
print(toys)

