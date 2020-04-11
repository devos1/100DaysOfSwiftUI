import UIKit

/*
 Creating Own Classes
 First diff with Structs : classes never come with a memberwise initializer
 */
class Dog {
    var name: String
    var breed: String

    init(name: String, breed: String) {
        self.name = name
        self.breed = breed
    }
}
let poppy = Dog(name: "Poppy", breed: "Poodle")

/*
 Class inheritance
 Second diff with Structs : Inheritance of course
 */
class Poodle: Dog {
    init(name: String) {
        super.init(name: name, breed: "Poodle")
    }
}

/*
 Overriding methods
 */
class Dog2 {
    func makeNoise() {
        print("Woof!")
    }
}
class Poodle2: Dog2 {
}
let poppy2 = Poodle2()
poppy2.makeNoise()
// Overriding
class Poodle3: Dog2 {
    override func makeNoise() {
        print("Yip!")
    }
}
let toto = Poodle3()
toto.makeNoise()

/*
 Final classes (no other class can inherit from it)
 */
final class Dog3 {
    var name: String
    var breed: String

    init(name: String, breed: String) {
        self.name = name
        self.breed = breed
    }
}

/*
 Copying objects
 Third diff with Structs : It's a reference not a value, so when we copy a struct, there are 2 distinct objects, but classes are the same object referenced
 */
class Singer {
    var name = "Taylor Swift"
}
var singer = Singer()
print(singer.name)
var singerCopy = singer
singerCopy.name = "Justin Bieber"
print(singer.name)

/*
 Deinitializers
 Fourth diff : can have deinitializers – code that gets run when an instance of a class is destroyed
 */
class Person {
    var name = "John Doe"

    init() {
        print("\(name) is alive!")
    }
    func printGreeting() {
        print("Hello, I'm \(name)")
    }
    deinit {
        print("\(name) is no more!")
    }
}
// Create many persons inside a loop because each time the loop goes around a new person will be created then destroyed
for _ in 1...3 {
    let person = Person()
    person.printGreeting()
}

/*
 Mutability
 Final diff : the way they deal with constants, with static classes it's possible to update properties but don't with structs
 */
class Singer2 {
    var name = "Taylor Swift"
    let age = 111               // if we use a constant it's not possible to update
}

let taylor = Singer2()
taylor.name = "Ed Sheeran"
print(taylor.name)

