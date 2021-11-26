//
//  BookwormApp.swift
//  Bookworm
//
//  Created by Jared Tamulynas on 11/24/21.
//

import SwiftUI

@main
struct BookwormApp: App {
    @StateObject private var dataController = DataController()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, dataController.container.viewContext)
        }
    }
}
