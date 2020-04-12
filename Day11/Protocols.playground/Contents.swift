import UIKit

// Description of that we want : like interface
protocol Identifiable {
    var id: String { get set }
}

struct User: Identifiable {
    var id: String
}

func displayID(thing: Identifiable) {
    print("My ID is \(thing.id)")
}

var u = User(id: "123")
displayID(thing: u)

/*
Protocol inheritance
 */
protocol Payable {
    func calculateWages() -> Int
}

protocol NeedsTraining {
    func study()
}

protocol HasVacation {
    func takeVacation(days: Int)
}

// Unlike Classes Protocols can inherit from multiple other protocols
protocol Employee: Payable, NeedsTraining, HasVacation { }

/*
 Extensions (Like Extension on C#)
 */
extension Int {
    func squared() -> Int {
        return self * self
    }
}
let number = 8
number.squared()
// Only computed properties are possible, no stored properties
extension Int {
    var isEven: Bool {
        return self % 2 == 0
    }
}

/*
 Protocol extensions
 */
// Both arrays and sets are conform to protocol named Collection
let pythons = ["Eric", "Graham", "John", "Michael", "Terry", "Terry"]
let beatles = Set(["John", "Paul", "George", "Ringo"])
extension Collection {
    func summarize() {
        print("There are \(count) of us:")

        for name in self {
            print(name)
        }
    }
}
pythons.summarize()
beatles.summarize()

/*
 Protocol-oriented programming
 */
protocol Identifiable2 {
    var id: String { get set }
    func identify()
}// Default function implementation
extension Identifiable2{
    func identify() {
        print("My ID is \(id).")
    }
}
struct User2: Identifiable2 {
    var id: String
}

let twostraws = User2(id: "twostraws")
twostraws.identify()
