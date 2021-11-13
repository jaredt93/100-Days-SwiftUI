//
//  ExpenseItem.swift
//  iExpense
//
//  Created by Jared Tamulynas on 11/11/21.
//

import Foundation

struct ExpenseItem: Identifiable, Codable {
    var id = UUID()
    let name: String
    let type: String
    let amount: Double
}
