//
//  NetworkError.swift
//  IiTochka
//
//  Created by Dmitrii Voronin on 28.11.2025.
//

import Foundation

enum NetworkError: Error, LocalizedError {
    case invalidURL
    case requestFailed(Error)
    case invalidResponse
    case decodingFailed(Error)
    case serverError(Int)
    
    var errorDescription: String? {
        switch self {
            case .invalidURL:
                return "Invalid URL"
            case .requestFailed(let error):
                return "Request failed: \(error.localizedDescription)"
            case .invalidResponse:
                return "Invalid response"
            case .decodingFailed(let error):
                return "Failed to decode response: \(error.localizedDescription)"
            case .serverError(let code):
                return "Server error with status code: \(code)"
        }
    }
}
