//
//  little_lemon_bistroApp.swift
//  little-lemon-bistro
//
//  Created by Quang Luu on 09/02/2023.
//

import SwiftUI

@main
struct little_lemon_bistroApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
