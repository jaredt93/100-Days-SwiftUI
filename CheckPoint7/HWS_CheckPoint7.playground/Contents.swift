import UIKit

class Animal {
    var legs: Int
    
    init(legs: Int) {
        self.legs = legs
    }
}


class Dog: Animal {
    
    func speak() {
        print("Bark")
    }
    
    init() {
        super.init(legs: 4)
    }
}

class Cat: Animal {
    var isTame: Bool
    
    init(isTame: Bool) {
        self.isTame = isTame
        super.init(legs: 4)
    }
    
    func speak() {
        print("Meow")
    }
}

class Corgi: Dog {
    
    override func speak() {
        print("Ow")
    }
}

class Poodle: Dog {
    override func speak() {
        print("Poo")
    }
}

class Persian: Cat {
    
    override func speak() {
        print("Meowsss")
    }
}

class Lion: Cat {
    
    override func speak() {
        print("Rawr")
    }
}
