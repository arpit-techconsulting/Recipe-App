//
//  RecipeAppApp.swift
//  RecipeApp
//
//  Created by Arpit Mallick on 10/18/24.
//

import SwiftUI

@main
struct RecipeAppApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
