import UIKit

/*
 Basic example like an anonymous function
 */
let driving = {
    print("I'm driving in my car")
}
driving() // Using a variable as a function call...

/*
 Accepting params in a closure
 One of the differences between functions and closures is that you don’t use parameter labels when running closures.
 */
let driving2 = {(place: String) in
    print("I'm going to \(place) in my car")
}
driving2("London")

/*
 Returning Values from Closures
 */
let drivingWithReturn = { (place: String) -> String in
    return "I'm going to \(place) in my car"
}
print(drivingWithReturn("Paris"))

/*
 Closures as Parameters
 */
func travel(action: () -> Void) {
    print("I'm getting ready to go.")
    action()
    print("I arrived!")
}
travel(action: driving)

/*
 Trailing Closures Syntax
 The same as before but with light syntax
 Attention only if last param is the closure
 */
print("----")
travel() {
    print("I'm driving in my car")
}
// It's possible even remove ()
travel {
    print("I'm driving in my car")
}
