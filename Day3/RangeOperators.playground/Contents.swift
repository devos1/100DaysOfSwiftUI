import UIKit

let score = 85

switch score {
case 0..<50:
    print("You failed badly.")
case 50..<85:  // LAST VALUE NOT INCLUDED
    print("You did OK.")
default:
    print("You did great!")
}

switch score {
case 0..<50:
    print("You failed badly.")
case 50...85:  // INCLUDED LAST VALUE
    print("You did OK.")
default:
    print("You did great!")
}

