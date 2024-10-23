//
//  NetworkManager.swift
//  RecipeApp
//
//  Created by Arpit Mallick on 10/18/24.
//

import Foundation

enum ApiError: Error, LocalizedError {
    case invalidUrl
    case invalidResponse
    case decodingError
    case badRequest(String) // 400 status code range
    case serverError(String) // 500 status code range
    case other(String)
}

protocol NetworkManagerActions {
    func apiCall<T: Decodable>(modelType: T.Type, apiUrl: String) async throws -> T
}

class NetworkManager: NetworkManagerActions {
    func apiCall<T>(modelType: T.Type, apiUrl: String) async throws -> T where T : Decodable {
        guard let url = URL(string: apiUrl) else {
            throw ApiError.invalidUrl
        }
        
        let (data, response) = try await URLSession.shared.data(from: url)
        guard let _response = response as? HTTPURLResponse else {
            throw ApiError.invalidResponse
        }
        
        switch _response.statusCode {
        case 200:
            do {
                let decodedData = try JSONDecoder().decode(T.self, from: data)
                return decodedData
            } catch {
                throw ApiError.decodingError
            }
            
        case 400..<500:
            throw ApiError.badRequest("Client error: \(_response.statusCode)")
            
        case 500..<600:
            throw ApiError.serverError("Internal Server Error: \(_response.statusCode)")
            
        default:
            throw ApiError.other("Unexpected status code: \(_response.statusCode)")
        }
    }
}
