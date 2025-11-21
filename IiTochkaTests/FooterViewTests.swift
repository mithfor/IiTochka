//
//  IiTochkaTests.swift
//  IiTochkaTests
//
//  Created by Dmitrii Voronin on 21.11.2025.
//

import XCTest
import SwiftUI
@testable import IiTochka
internal import Combine

// MARK: - Mock Classes for Testing
final class MockFooterViewModel: FooterViewModel {
    @MainActor var onUpdateCalled = false
    
    override init(location: String, views: String, hearts: String) {
        super.init(location: location, views: views, hearts: hearts)
    }
}


final class MockFooterViewModelFactory: FooterViewModelFactory {
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

@MainActor
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
    
    func testDirectViewModelInitializer_UsesProvidedViewModel() async {
        // Given
        let expectedViewModel = await MainActor.run {
            FooterViewModel(location: "Direct Location",
                            views: "111",
                            hearts: "222")
        }
        
        // When
        let footerView = FooterView(viewModel: expectedViewModel)
        
        // Then
        XCTAssertNotNil(footerView)
    }
    
    func testFooterViewModel_Initialization() {
        // Given
        let location = "Test Location"
        let views = "111"
        let hearts = "222"
        
        // When
        let viewModel = MockFooterViewModel(location: location, views: views, hearts: hearts)
        
        // Then
        XCTAssertEqual(viewModel.location, location)
        XCTAssertEqual(viewModel.views, views)
        XCTAssertEqual(viewModel.hearts, hearts)
    }
    
    func testFooterViewModel_PublishedProperties() {
        // Given
        let viewModel = MockFooterViewModel(location: "Test", views: "111", hearts: "222")
        
        // When & Then - Test property observers if needed
        let expectation = expectation(description: "Published properti update")
        
        let cancellable = viewModel.$location
            .dropFirst()
            .sink { newValue in
                XCTAssertEqual(newValue, "Updated location")
                expectation.fulfill()
            }
        
        // Trigger update
        viewModel.location = "Updated location"
        
        waitForExpectations(timeout: 1.0)
        cancellable.cancel()
    }
    
    // MARK: - Factory protocol tests
    func testDefaultFooterViewFactory_CreatesViewModel() async {
        // Given
        let factory = DefaultFooterViewModelFactory()
        let location = "Test location"
        let views = "111"
        let hearts = "222"
        
        // When
        let viewModel = await MainActor.run {
            factory.makeFooterViewModel(location: location, views: views, hearts: hearts)
        }
        
        // Then
        XCTAssertEqual(viewModel.location, location)
        XCTAssertEqual(viewModel.views, views)
        XCTAssertEqual(viewModel.hearts, hearts)
        XCTAssertTrue(type(of: viewModel) == FooterViewModel.self)
    }
}
