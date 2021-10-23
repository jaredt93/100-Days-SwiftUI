import UIKit

let luckyNumbers = [7, 4, 38, 21, 16, 15, 12, 33, 31, 49]
print(luckyNumbers)

var newArray = luckyNumbers.filter { !$0.isMultiple(of: 2) }.sorted().map { String($0) + " is a lucky number" }

for line in newArray {
    print(line)
}


