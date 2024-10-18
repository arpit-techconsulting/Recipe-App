//
//  ContentView.swift
//  RecipeApp
//
//  Created by Arpit Mallick on 10/18/24.
//

import SwiftUI
import CoreData

struct HomeView: View {
    @Environment(\.managedObjectContext) private var viewContext

    var body: some View {
        NavigationStack {
            Text("Hello World!!")
        }
    }
}

#Preview {
    HomeView()
}
