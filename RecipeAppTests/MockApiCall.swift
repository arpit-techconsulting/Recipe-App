//
//  MockApiCall.swift
//  RecipeAppTests
//
//  Created by Arpit Mallick on 10/21/24.
//

import Foundation
@testable import RecipeApp

class MockApiCall: NetworkManagerActions {
    let fileName: String
    
    init(fileName: String) {
        self.fileName = fileName
    }
    
    func apiCall<T>(modelType: T.Type, apiUrl: String) async throws -> T where T : Decodable {
        if let path = Bundle.main.url(forResource: fileName, withExtension: ".json") {
            do {
                let data = try Data(contentsOf: path)
                return try JSONDecoder().decode(modelType, from: data)
            } catch {
                throw error
            }
        }
        
        throw URLError(.badURL)
        
    }
}
