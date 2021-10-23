import UIKit

protocol Building {
    var rooms: Int { get set }
    var cost: Int { get set }
    var nameAgent: String { get set }
    
    func salesSummary()
}


struct House: Building {
    var rooms: Int
    var cost: Int
    var nameAgent: String
    
    func salesSummary() {
        print("House, \(rooms) rooms, $\(cost), Sold By: \(nameAgent)")
    }
}

struct Office: Building {
    var rooms: Int
    var cost: Int
    var nameAgent: String
    
    func salesSummary() {
        print("Office, \(rooms) rooms, $\(cost), Sold By: \(nameAgent)")
    }
    
}

var office = Office(rooms: 10, cost: 5000000, nameAgent: "Jared")
office.salesSummary()
