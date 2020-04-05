import UIKit

/*
 For Loops
 */
let count = 1...10
for item in count {
    print("Number is \(item)")
}

let albums = ["Red", "1989", "Reputation"]
for album in albums {
    print("\(album) is on Apple Music")
}

// If we don't need a var
for _ in 1...5 {
    print("Play")
}
//---------------------------------------------------------
/*
 While Loops
 */
var number = 1

while number <= 20 {
    print(number)
    number += 1
}

print("Ready or not, here I come!")
//---------------------------------------------------------
/*
 Repeat Loops, the same as Loop Until
 Always enter in the loop once
 */
var number2 = 1

repeat {
    print(number2)
    number2 += 1
} while number2 <= 20

print("Ready or not, here I come!")
//---------------------------------------------------------
/*
 Exiting Loops
 Attention, not the best solution
 */
var countDown = 10
while countDown >= 0 {
    print(countDown)
    if countDown == 4 {
        print("I'm bored. Let's go now!")
        break
    }
    countDown -= 1
}
//---------------------------------------------------------
/*
 Exiting Multiple Loops
 Inner and Outer Loops
 With a regular break, only the inner loop would be exited – the outer loop would continue where it left off.
 */
outerLoop: for i in 1...10 {
    for j in 1...10 {
        let product = i * j
        print ("\(i) * \(j) is \(product)")

        if product == 50 {
            print("It's a bullseye!")
            break outerLoop
        }
    }
}
//---------------------------------------------------------
/*
 Skipping Items
 */
for i in 1...10 {
    if i % 2 == 1 {
        continue
    }
    print(i)
}
//---------------------------------------------------------
/*
 Infinite Loops
 */
var counter = 0

while true {
    print(" ")
    counter += 1

    if counter == 273 {
        break
    }
}
