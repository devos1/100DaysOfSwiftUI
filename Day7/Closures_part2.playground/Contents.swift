import UIKit

/*
 Using closures as parameters when they accept parameters
 */
func travel(action: (String) -> Void) {
    print("I'm getting ready to go.")
    action("London")
    print("I arrived!")
}
travel {(place: String) in
    print("I'm going to \(place) in my car")
}

/*
 Using closures as parameters when they return values
 */
func travel(action: (String) -> String) {
    print("I'm getting ready to go.")
    let description = action("Paris")
    print(description)
    print("I arrived!")
}
travel {(place: String) -> String in
    return "I'm going to \(place) in my car"
}

/*
 Shorthand parameter names
 */
// Swift knows the parameter to that closure must be a string, so we can remove it
travel {place -> String in
    return "I'm going to \(place) in my car"
}
// It also knows the closure must return a string, so we can remove that
travel {place in
    return "I'm going to \(place) in my car"
}
// As the closure only has one line of code that must be the one that returns the value, so Swift lets us remove the return keyword too
travel { place in
    "I'm going to \(place) in my car"
}
// Swift has a shorthand syntax that lets you go even shorter. Rather than writing place in we can let Swift provide automatic names for the closure’s parameters. These are named with a dollar sign, then a number counting from 0.
travel {
    "I'm going to \($0) in my car"
}

/*
 Closures with multiple parameters
 */
func travel(action: (String, Int) -> String) {
    print("I'm getting ready to go.")
    let description = action("London", 60)
    print(description)
    print("I arrived!")
}
travel {
    "I'm going to \($0) at \($1) miles per hour."
}

/*
 Returning closures from functions
 First return for Closure and second for function
 */
func travel() -> (String) -> Void {
    return {
        print("I'm going to \($0)")
    }
}
let result = travel()
result("London")
// Another way but not really recommended
let result2 = travel()("Paris")

/*
 Capturing Values
 */
func travel3() -> (String) -> Void {
    var counter = 1
    return {
        print("\(counter). I'm going to \($0)")
        counter += 1
    }
}
let result3 = travel3()
result3("Porto")
result3("Porto")
result3("Porto")

