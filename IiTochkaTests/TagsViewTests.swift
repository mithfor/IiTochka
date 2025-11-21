//
//  TagsViewTests.swift
//  IiTochkaTests
//
//  Created by Dmitrii Voronin on 21.11.2025.
//

import XCTest
import SwiftUI
@testable import IiTochka

@MainActor
class TagsViewTests: XCTestCase {
    override class func setUp() {
        super.setUp()
        // code here
        
    }
    
    override class func tearDown() {
        // code here
        
        super.tearDown()
    }
    
    func testViewModel_InitializationWithEmptyTags() async {
        // Given
        
        // When
        let viewModel = TagsViewModel(tags: [])
        
        // Then
        XCTAssertTrue(viewModel.tags.isEmpty)
    }
}
