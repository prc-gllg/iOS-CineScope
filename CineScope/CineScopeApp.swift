//
//  CineScopeApp.swift
//  CineScope
//
//  Created by Pierce Gallego on 8/25/23.
//

import SwiftUI

@main
struct CineScopeApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView2()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
