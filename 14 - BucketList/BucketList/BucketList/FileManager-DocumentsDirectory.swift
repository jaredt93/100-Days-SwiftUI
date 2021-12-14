//
//  FileManager-DocumentsDirectory.swift
//  BucketList
//
//  Created by Jared Tamulynas on 12/13/21.
//

import Foundation

extension FileManager {
    static var documentsDirectory: URL {
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        return paths[0]
    }
}
