//
//  HomeViewModel.swift
//  RecipeApp
//
//  Created by Arpit Mallick on 10/18/24.
//

import Foundation

class HomeViewModel: ObservableObject {
    let networkManager: NetworkManagerActions
    @Published var allRecipes: [Recipes] = []
    
    init(networkManager: NetworkManagerActions) {
        self.networkManager = networkManager
    }
    
    @MainActor
    func getAllRecipes() async {
        do {
            let allRecipes = try await networkManager.apiCall(modelType: DataModel.self, apiUrl: "https://dummyjson.com/recipes?limit=0&skip=0")
            self.allRecipes = allRecipes.recipes
        } catch {
            print(error.localizedDescription)
        }
    }
}
