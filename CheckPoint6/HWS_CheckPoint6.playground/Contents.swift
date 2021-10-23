import UIKit

struct Car {
    let model: String
    let numberSeats: Int
    var currentGear: Int
    
    mutating func changeGear(up: Bool) {
        if up {
            currentGear += 1
        } else {
            currentGear -= 1
        }
    }
}


var mercedes = Car(model: "new", numberSeats: 4, currentGear: 2)
print(mercedes)

mercedes.changeGear(up: true)
print(mercedes)
