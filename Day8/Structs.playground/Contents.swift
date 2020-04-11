import UIKit

/*
 Creating Structs
 */
struct Sport {
    var name: String
}
// Create an instance of Sport
var tennis = Sport(name: "Tennis")
print(tennis.name)
// Change property value
tennis.name = "Toto Tennis"
print(tennis.name)

/*
 Computed Properties
 */
struct Sport2 {
    var name: String
    var isOlympicSport: Bool

    var olympicStatus: String {
        if isOlympicSport {
            return "\(name) is an Olympic sport"
        } else {
            return "\(name) is not an Olympic sport"
        }
    }
}
let chessBoxing = Sport2(name: "Chessboxing", isOlympicSport: false)
print(chessBoxing.olympicStatus)

/*
 Property observers
 This will run some code every time amount changes
 You can also use willSet to take action before a property changes, but that is rarely used
 */
struct Progress {
    var task: String
    var amount: Int {
        didSet {
            print("\(task) is now \(amount)% complete")
        }
    }
}
var progress = Progress(task: "Loading data", amount: 0)
progress.amount = 30
progress.amount = 80
progress.amount = 100

/*
 Methods
 */
struct City {
    var population: Int

    func collectTaxes() -> Int {
        return population * 1000
    }
}
let london = City(population: 9_000_000)
print("Total Collected \(london.collectTaxes())")

/*
 Mutating methods
 */
struct Person {
    var name: String

    mutating func makeAnonymous() {
        name = "Anonymous"
    }
}
// If it's a var -> update ok
var person = Person(name: "Ed")
print(person.name)
person.makeAnonymous()
print(person.name)
// If it's a contant -> not updated
let p2 = Person(name: "Toto")
print(p2.name)
// Here it's produce an error so I have to comment
//p2.makeAnonymous()
print(p2.name)

