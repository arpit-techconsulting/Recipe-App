//
//  DataModel.swift
//  RecipeApp
//
//  Created by Arpit Mallick on 10/18/24.
//

import Foundation

struct Recipes: Decodable {
    let id: Int64
    let name: String
    let ingredients: [String]
    let instructions: [String]
    let prepTimeMinutes: Int64
    let cookTimeMinutes: Int64
    let servings: Int64
    let difficulty: String
    let cuisine: String
    let caloriesPerServing: Int64
    let tags: [String]
    let image: String
    let rating: Double
    let mealType: [String]
}

struct DataModel: Decodable {
    let recipes: [Recipes]
}
