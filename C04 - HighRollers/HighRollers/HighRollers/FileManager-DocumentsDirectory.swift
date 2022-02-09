//
//  FileManager-DocumentsDirectory.swift
//  HighRollers
//
//  Created by Jared WIlliam Tamulynas on 2/9/22.
//

import Foundation

extension FileManager {
    static var documentsDirectory: URL {
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        return paths[0]
    }
}
