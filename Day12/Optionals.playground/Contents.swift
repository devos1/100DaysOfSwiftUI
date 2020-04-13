import UIKit

/*
 Handling missing data
 */
var age: Int? = nil
age = 38
print(age) // Print (Optional(38)) Implicitly coerced

/*
 Unwrapping optionals
 */
var name: String? = nil
print(name?.count) // Print nil and is implicity coerced from Int? to Any

if let unwrapped = name {
    print("\(unwrapped.count) letters")
} else {
    print("Missing name.")
}

/*
 Unwrapping with guard
 the major difference between if let and guard let is that your unwrapped optional remains usable after the guard code
 */
func greet(_ name: String?) {
    guard let unwrapped = name else {
        print("You didn't provide a name!")
        return
    }

    print("Hello, \(unwrapped)!")
}

/*
 Force unwrapping
 */
let str = "5"
let num = Int(str)      // Int?
let num2 = Int(str)!    // Regulat Int
print(num)
print(num2)

/*
 Implicitly unwrapped optionals
 */
var age2: Int! = nil
age2 = 10
print(age2)

/*
 Nil coalescing
 */
func username(for id: Int) -> String? {
    if id == 1 {
        return "Taylor Swift"
    } else {
        return nil
    }
}
let user = username(for: 15) ?? "Anonymous"

/*
 Optional chaining
 */
let names = ["John", "Paul", "George", "Ringo"]
let beatle = names.first?.uppercased()
// That question mark is optional chaining – if first returns nil then Swift won’t try to uppercase it, and will set beatle to nil immediately.

/*
 Optional try
 */
// Function used in previous day
enum PasswordError: Error {
    case obvious
}

func checkPassword(_ password: String) throws -> Bool {
    if password == "password" {
        throw PasswordError.obvious
    }

    return true
}

//do {
//    try checkPassword("password")
//    print("That password is good!")
//} catch {
//    print("You can't use that password.")
//}

// Another way to run checkPassword
if let result = try? checkPassword("password") {
    print("Result was \(result)")
} else {
    print("D'oh.")
}
// And another way, attention use when you know for sure that the function will not fail. If the function does throw an error, your code will crash.
try! checkPassword("sekrit")
print("OK!")

/*
 Failable initializers
 */
struct Person {
    var id: String
    
    // init? instead init
    init?(id: String) {
        if id.count == 9 {
            self.id = id
        } else {
            return nil
        }
    }
}

/*
 Typecasting
 */
class Animal { }
class Fish: Animal { }
class Dog: Animal {
    func makeNoise() {
        print("Woof!")
    }
}
let pets = [Fish(), Dog(), Fish(), Dog()]
for pet in pets {
    if let dog = pet as? Dog {
        dog.makeNoise()
    }
}
