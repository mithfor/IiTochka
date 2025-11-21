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
        let viewModel = TagsViewModel()
        
        // Then
        XCTAssertTrue(viewModel.tags.isEmpty)
    }
    
    func testViewModel_InitializationWithSomeTagItems() async {
        // Given
        let tag1 = TagViewItem(title: "test1", isSelected: false)
        let tag2 = TagViewItem(title: "test2", isSelected: false)
        
        let tags: [TagViewItem] = [tag1, tag2]
        
        // When
        let viewModel = TagsViewModel(tags: tags)
        
        // Then
        XCTAssertEqual(viewModel.tags.count, 2)
        XCTAssertEqual(viewModel.tags[0], tag1)
        XCTAssertEqual(viewModel.tags[1], tag2)
    }
    
    // TODO: - Test factory
}
