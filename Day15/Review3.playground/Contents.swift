import UIKit

// Basic Structure
struct Person {
    var clothes: String
    var shoes: String

    func describe() {
        print("I like wearing \(clothes) with \(shoes)")
    }
}

let taylor = Person(clothes: "T-shirts", shoes: "sneakers")
let other = Person(clothes: "short skirts", shoes: "high heels")
taylor.describe()
other.describe()

// Property Observer
struct Person2 {
    var clothes: String {
        willSet {
            updateUI(msg: "I'm changing from \(clothes) to \(newValue)")
        }

        didSet {
            updateUI(msg: "I just changed from \(oldValue) to \(clothes)")
        }
    }
}

func updateUI(msg: String) {
    print(msg)
}

var taylor2 = Person2(clothes: "T-shirts")
taylor2.clothes = "short skirts"

// Computed Properties
struct Person3 {
    var age: Int

    var ageInDogYears: Int {
        get {
            return age * 7
        }
    }
    
// If you intend to use them only for reading data you can just remove the get part entirely, like this:
//    var ageInDogYears: Int {
//        return age * 7
//    }
}

var fan = Person3(age: 25)
print(fan.ageInDogYears)

// Static Properties and Methods
struct TaylorFan {
    static var favoriteSong = "Look What You Made Me Do"

    var name: String
    var age: Int
}

let fan2 = TaylorFan(name: "James", age: 25)
print(TaylorFan.favoriteSong)

// Access Control
class TaylorFan2 {
    private var name: String?
}

/*
 Polymorphism
 */
class Album {
    var name: String

    init(name: String) {
        self.name = name
    }
}

class StudioAlbum: Album {
    var studio: String

    init(name: String, studio: String) {
        self.studio = studio
        super.init(name: name)
    }
}

class LiveAlbum: Album {
    var location: String

    init(name: String, location: String) {
        self.location = location
        super.init(name: name)
    }
}

var taylorSwift = StudioAlbum(name: "Taylor Swift", studio: "The Castles Studios")
var fearless = StudioAlbum(name: "Speak Now", studio: "Aimeeland Studio")
var iTunesLive = LiveAlbum(name: "iTunes Live from SoHo", location: "New York")

var allAlbums: [Album] = [taylorSwift, fearless, iTunesLive]

class Album2 {
    var name: String

    init(name: String) {
        self.name = name
    }

    func getPerformance() -> String {
        return "The album \(name) sold lots"
    }
}

class StudioAlbum2: Album2 {
    var studio: String

    init(name: String, studio: String) {
        self.studio = studio
        super.init(name: name)
    }

    override func getPerformance() -> String {
        return "The studio album \(name) sold lots"
    }
}

class LiveAlbum2: Album2 {
    var location: String

    init(name: String, location: String) {
        self.location = location
        super.init(name: name)
    }

    override func getPerformance() -> String {
        return "The live album \(name) sold lots"
    }
}

var taylorSwift2 = StudioAlbum2(name: "Taylor Swift", studio: "The Castles Studios")
var fearless2 = StudioAlbum2(name: "Speak Now", studio: "Aimeeland Studio")
var iTunesLive2 = LiveAlbum2(name: "iTunes Live from SoHo", location: "New York")

var allAlbums2: [Album2] = [taylorSwift2, fearless2, iTunesLive2]

for album in allAlbums2 {
    print(album.getPerformance())
}

// Converting types with typecasting
for album in allAlbums2 {
    let studioAlbum = album as? StudioAlbum
}

for album in allAlbums2 {
    print(album.getPerformance())

    if let studioAlbum = album as? StudioAlbum {
        print(studioAlbum.studio)
    } else if let liveAlbum = album as? LiveAlbum {
        print(liveAlbum.location)
    }
}

// There is more, it's a good chapter. To read again if necessary

/*
 Closures
 */
let vw = UIView()

UIView.animate(withDuration: 0.5, animations: {
    vw.alpha = 0
})

// Trailing closures more readable
let vw2 = UIView()

UIView.animate(withDuration: 0.5) {
    vw.alpha = 0
}
