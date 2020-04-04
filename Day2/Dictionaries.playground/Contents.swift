import UIKit

let heights = ["toto": 1.78, "titi": 1.73]

heights["toto"]

let favoriteIceCream = [
    "Toto" : "Chocolate",
    "Titi" : "Vanilla",
]

favoriteIceCream["Toto"]

// Returna nil
favoriteIceCream["Tata"]

// We can add a default value to replace nil
// ATTENTION : Seems doesn't work
favoriteIceCream["Tata", default: "Unknown"]
favoriteIceCream["Tate"]

