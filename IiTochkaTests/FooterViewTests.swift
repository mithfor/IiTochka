//
//  IiTochkaTests.swift
//  IiTochkaTests
//
//  Created by Dmitrii Voronin on 21.11.2025.
//

import XCTest
import SwiftUI
@testable import IiTochka

// MARK: - Mock Classes for Testing
final class MockFooterViewModel: FooterViewModel {
    @MainActor var onUpdateCalled = false
    
    override init(location: String, views: String, hearts: String) {
        super.init(location: location, views: views, hearts: hearts)
    }
}

class MockFooterViewModelFactory: FooterViewModelFactory {
    var makeViewModelCalled = false
    var passedLocation: String?
    var passedViews: String?
    var passedHearts: String?
    
    func makeFooterViewModel(location: String, views: String, hearts: String) -> FooterViewModel {
        makeViewModelCalled = true
        passedLocation = location
        passedViews = views
        passedHearts = hearts
        return MockFooterViewModel(location: location, views: views, hearts: hearts)
    }
}

// MARK: - Test Cases
class FooterViewTests: XCTestCase {
    
    private var mockFactory: MockFooterViewModelFactory!
    
    override func setUp() {
        super.setUp()
        mockFactory = MockFooterViewModelFactory()
    }
    
    override func tearDown() {
        mockFactory = nil
        super.tearDown()
    }
    
    // MARK: - Factory Tests
    func testFactoryInitializer_CreatesViewModelWithCorrectParameters() {
        // Given
        let expectedLocation = "Test Location"
        let expectedViews = "999"
        let expectedHearts = "888"
        
        // When
        _ = FooterView(
            factory: mockFactory,
            location: expectedLocation,
            views: expectedViews,
            hearts: expectedHearts
        )
        
        // Then
        XCTAssertTrue(mockFactory.makeViewModelCalled)
        XCTAssertEqual(mockFactory.passedLocation, expectedLocation)
        XCTAssertEqual(mockFactory.passedViews, expectedViews)
        XCTAssertEqual(mockFactory.passedHearts, expectedHearts)
    }
}
