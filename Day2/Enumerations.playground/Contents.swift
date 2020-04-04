import UIKit

enum Result {
    case success
    case failure
}

let result = Result.success
let result2 = Result.failure


// Standard Enm for few activities
enum Activity{
    case bored
    case running
    case talking
    case singing
}

// Now using Enum Associated with more nuance
enum Activity2{
    case bored
    case running(destination: String)
    case talking(topic: String)
    case singing(volume: Int)
}

let talking = Activity2.talking(topic: "Football")

// Now using Raw value or index to access an element
enum Planet: Int{
    case mercury
    case venus
    case earth
    case mars
}

let earth = Planet(rawValue: 2)

// We can modify the start of index
enum Planet2: Int{
    case mercury = 1
    case venus
    case earth
    case mars
}

let p = Planet2(rawValue: 2)

