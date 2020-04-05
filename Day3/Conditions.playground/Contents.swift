import UIKit

let firstCard = 11
let secondCard = 10

if firstCard + secondCard == 21 {
    print("Blackjack...")
}
if firstCard + secondCard == 21 {
    print("Blackjack")
}else{
    print("Regular Cards")
}
if firstCard + secondCard == 2 {
    print("Aces – lucky!")
}else if firstCard + secondCard == 21{
    print("Blackjack")
}else{
    print("Regular Cards")
}

// Combining Operators
let age1 = 12
let age2 = 21

if age1 > 18 && age2 > 18 {
    print("Both are over 18")
}

if age1 > 18 || age2 > 18 {
    print("At leat one is over 18")
}


