//
//  ContentView.swift
//  RecipeApp
//
//  Created by Arpit Mallick on 10/18/24.
//

import SwiftUI
import CoreData

struct HomeView: View {
    @StateObject var homeViewModel: HomeViewModel

    var body: some View {
        List {
            ForEach(homeViewModel.allRecipes, id: \.id) {recipe in
                Text("\(recipe.id). \(recipe.name)")
            }
        }
        .task {
            await homeViewModel.getAllRecipes()
            print(homeViewModel.allRecipes.count)
        }
    }
}

#Preview {
    
    HomeView(homeViewModel: HomeViewModel())
}
