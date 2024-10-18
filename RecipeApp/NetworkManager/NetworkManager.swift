//
//  NetworkManager.swift
//  RecipeApp
//
//  Created by Arpit Mallick on 10/18/24.
//

import Foundation

protocol NetworkManagerActions {
    func apiCall<T: Decodable>(modelType: T.Type, apiUrl: String) async throws -> T
}

class NetworkManager: NetworkManagerActions {
    func apiCall<T>(modelType: T.Type, apiUrl: String) async throws -> T where T : Decodable {
        <#code#>
    }
}
