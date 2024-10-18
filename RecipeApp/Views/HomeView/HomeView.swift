//
//  ContentView.swift
//  RecipeApp
//
//  Created by Arpit Mallick on 10/18/24.
//

import SwiftUI
import CoreData

struct HomeView: View {
    @StateObject var homeViewModel = HomeViewModel(networkManager: NetworkManager())
    @Environment(\.managedObjectContext) private var viewContext

    var body: some View {
        List {
            
        }
        .task {
            await homeViewModel.getAllRecipes()
            printRecipes()
        }
    }
    
    private func printRecipes() {
        print(homeViewModel.allRecipes.count)
        for recipe in homeViewModel.allRecipes {
            print(recipe)
        }
    }
}

#Preview {
    HomeView()
}
