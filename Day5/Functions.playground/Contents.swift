import UIKit

// Function definition
func printHelp() {
    let message = """
Welcome to MyApp!

Run this app inside a directory of images and
MyApp will resize them all into thumbnails
"""

    print(message)
}

printHelp()

//-----------------------------------------------

/*
 Using Params
 */
func square(number: Int) {
    print(number * number)
}
square(number: 2)

//-----------------------------------------------

/*
 Returning Values
 Attention to return multpiple values -> tuples is the solution
 */
func square2(number: Int) -> Int {
    return number * number
}
print(square2(number: 8))

//-----------------------------------------------

/*
 Parameter Labels
 One name to use inside function
 And another to name to use during the call
 */
func sayHello(to name: String) {
    print("Hello, \(name)!")
}

sayHello(to: "Toto")

//-----------------------------------------------

/*
 Omiting Parameter Labels
 Using _ instead a name
 */
func greet(_ person: String) {
    print("Hello, \(person)!")
}

greet("Titi")

//-----------------------------------------------

/*
 Default Parameters
 */
func greet(_ person: String, nicely: Bool = true) {
    if nicely == true {
        print("Hello, \(person)!")
    } else {
        print("Oh no, it's \(person) again...")
    }
}
greet("Tata")
greet("Toto", nicely: false)

//-----------------------------------------------

/*
 Variadic Functions
 print function is an example where we can pass many parameters of the same type
 the param needs to be [type]...
 */
print("Haters", "gonna", "hate")

func square(numbers: Int...) {
    for number in numbers {
        print("\(number) squared is \(number * number)")
    }
}

square(numbers: 2,3,4,5,6)

//-----------------------------------------------

/*
 Writing throwing functions
 */
enum PasswordError: Error {
    case obvious
}

func checkPassword(_ password: String) throws -> Bool {
    if password == "password" {
        throw PasswordError.obvious
    }

    return true
}

// Testing this function (try..catch a little bit different!!)
do {
    try checkPassword("password")
    print("That password is good!")
} catch {
    print("You can't use that password.")
}

//-----------------------------------------------

/*
 InOut Parameters
 */
func doubleInPlace(number: inout Int) {
    number *= 2
}

var myNum = 10
print(myNum)
doubleInPlace(number: &myNum)
print(myNum)

