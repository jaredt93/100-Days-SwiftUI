//
//  FileManager-DocumentsDirectory.swift
//  HotProspects
//
//  Created by Jared Tamulynas on 1/30/22.
//

import Foundation

extension FileManager {
    static var documentsDirectory: URL {
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        return paths[0]
    }
}
