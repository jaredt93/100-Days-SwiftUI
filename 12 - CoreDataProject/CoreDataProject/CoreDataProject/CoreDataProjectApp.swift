//
//  CoreDataProjectApp.swift
//  CoreDataProject
//
//  Created by Jared Tamulynas on 11/29/21.
//

import SwiftUI

@main
struct CoreDataProjectApp: App {
    @StateObject private var dataController = DataController()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, dataController.container.viewContext)
        }
    }
}
