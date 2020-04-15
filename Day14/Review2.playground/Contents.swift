import UIKit

/*
 Reviews about
 - Functions
 - Optionals
 - Optional Chaining
 - Enumerations
 - Structs
 - Classes
 */

func countLetters(in string: String) {
    print("The string \(string) has \(string.count) letters.")
}
// The in is just for better reading or understanding not used inside function
countLetters(in: "Hello")

// Optional return value
func getHaterStatus(weather: String) -> String? {
    if weather == "sunny" {
        return nil
    } else {
        return "Hate"
    }
}

var status: String?
status = getHaterStatus(weather: "rainy")
// or
var status2 = getHaterStatus(weather: "rainy")
