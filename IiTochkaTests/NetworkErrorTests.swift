//
//  NetworkErrorTests.swift
//  IiTochkaTests
//
//  Created by Dmitrii Voronin on 28.11.2025.
//

import XCTest
@testable import IiTochka

class NetworkErrorTests: XCTestCase {
    
    // MARK: - Test Cases Exist
    func test_NetworkError_CasesExist() {
        // Given
        let expectedCases: [NetworkError] = [
            .invalidURL,
            .requestFailed(NSError(domain: "test", code: 0)),
            .invalidResponse,
            .decodingFailed((NSError(domain: "test", code: 0))),
            .serverError(500)
        ]
        
        // Then
        XCTAssertEqual(expectedCases.count, 5)
    }
    
    func testInvalidURL_ErrorDescription() {
        // Given
        let error = NetworkError.invalidURL
        
        // When
        let description = error.errorDescription
        
        // Then
        XCTAssertEqual(description, "Invalid URL")
    }
    
    func testRequestFailed_ErrorDescrption() {
        
        // Given
        let underlyingError = NSError(domain: "TestDomain",
                                      code: 42,
                                      userInfo: [NSLocalizedDescriptionKey: "Underlying error"])
        let error = NetworkError.requestFailed(underlyingError)
        
        // When
        let description = error.errorDescription
        
        // Then
        XCTAssertEqual(description, "Request failed: Underlying error")
    }
    
    func testInvalidResponse_ErrorDescription() {
        // Given
        let error = NetworkError.invalidResponse
        
        // When
        let description = error.errorDescription
        
        // Then
        XCTAssertEqual(description, "Invalid response")
    }
    
    func testDecodingFailed_ErrorDescription() {
        // Given
        let decodingError = DecodingError.dataCorrupted(DecodingError.Context(codingPath: [],
                                                                              debugDescription: "Test decoding error"))
        let error = NetworkError.decodingFailed(decodingError)
        
        // When
        let description = error.errorDescription
        
        // Then
        XCTAssertEqual(description, "Failed to decode response: The data couldn’t be read because it isn’t in the correct format.")
    }
    
    func testServerError_ErrorDescription() {
        // Given
        let error = NetworkError.serverError(500)
        
        // When
        let description = error.errorDescription
        
        // Then
        XCTAssertEqual(description, "Server error with status code: 500")
    }
    
    
    // TODO: - Make NetworkError enum equatable
//    func testRequestFailedEquatable() {
//        // Given
//        let nsError1 = NSError(domain: "test", code: 1)
//        let nsError2 = NSError(domain: "test", code: 2)
//        let error1 = NetworkError.requestFailed(nsError1)
//        let error2 = NetworkError.requestFailed(nsError1)
//        let error3 = NetworkError.requestFailed(nsError2)
//        // When
//        // Then
//        XCTAssertEqual(error1, error2)
//        XCTAssertNotEqual(error1, error3)
//        
//    }
//    
//    func test() {
//        // Given
//        // When
//        // Then
//    }
}
