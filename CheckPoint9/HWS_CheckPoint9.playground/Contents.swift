import UIKit

func randomInteger(in array: [Int]?) -> Int {
    array?.randomElement() ?? Int.random(in: 1...100)
}

print(randomInteger(in: [5, 6, 888, 76, 8, 89]))
print(randomInteger(in: nil))
