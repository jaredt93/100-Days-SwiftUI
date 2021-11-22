//
//  String-EmptyChecking.swift
//  CupcakeCorner
//
//  Created by Jared Tamulynas on 11/22/21.
//

import Foundation

extension String {
    var isReallyEmpty: Bool {
        self.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty
    }
}
