import UIKit

/*
 Initializers
 */
struct User {
    var username: String
}
var user = User(username: "twostraws")

struct User2 {
    var username: String

    init() {
        username = "Anonymous"
        print("Creating a new user!")
    }
}
var u2 = User2()
print(u2.username)

/*
 Referring to the current instance (self)
 Useful when the param name is the same as internal property
 */
struct Person {
    var name: String

    init(name: String) {
        print("\(name) was born!")
        self.name = name
    }
}

/*
 Lazy Properties
 */
struct FamilyTree {
    init() {
        print("Creating family tree!")
    }
}

// In this case familyTree id directly available
struct Person2 {
    var name: String
    var familyTree = FamilyTree()

    init(name: String) {
        self.name = name
    }
}
var ed = Person2(name: "Ed")

// In this case it's available when we access to the property at least once
struct Person3 {
    var name: String
    lazy var familyTree = FamilyTree()

    init(name: String) {
        self.name = name
    }
}
// Not visible
var toto = Person3(name: "Toto")
// Now visible
toto.familyTree

/*
 Static properties and methods
 */
struct Student {
    static var classSize = 0
    var name: String

    init(name: String) {
        self.name = name
        Student.classSize += 1
    }
}

let titi = Student(name: "titi")
print(Student.classSize)
let taylor = Student(name: "Taylor")
print(Student.classSize)

/*
 Access Control
 */
struct Person4 {
    private var id: String

    init(id: String) {
        self.id = id
    }
    func identify() -> String {
        return "My social security number is \(id)"
    }
}

let zozo = Person4(id: "12345")
// zozo.id Not Possible
// Like this ok
print(zozo.identify())


