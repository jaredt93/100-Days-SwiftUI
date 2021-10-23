import UIKit

enum SquareRootError: Error {
    case noRoot, outOfBounds
}


func squareRoot(number: Int) throws -> Int {
    if number < 1 || number > 10000 {
        throw SquareRootError.outOfBounds
    }
    
    for root in 1...100 {
        if number == root * root {
            return root
        }
    }
    
    throw SquareRootError.noRoot
}

do {
    try squareRoot(number: 0)
} catch {
    print(error.localizedDescription)
}

do {
    try squareRoot(number: 10000)
} catch {
    print(error.localizedDescription)
}

do {
    try squareRoot(number: 1000000)
} catch {
    print(error.localizedDescription)
}

do {
    try squareRoot(number: 80)
} catch {
    print(error.localizedDescription)
}
