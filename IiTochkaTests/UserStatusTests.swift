//
//  UserStatusTests.swift
//  IiTochka
//
//  Created by Dmitrii Voronin on 21.11.2025.
//


import XCTest
@testable import IiTochka

class UserStatusTests: XCTestCase {
    
    func testOnlineImageName() {
        // Given
        let status = UserStatus.online
        
        // When
        let imageName = status.imageName
        
        // Then
        XCTAssertEqual(imageName, "checkmark.seal.fill")
    }
    
    func testOfflineImageName() {
        // Given
        let status = UserStatus.offline
        
        // When
        let imageName = status.imageName
        
        // Then
        XCTAssertEqual(imageName, "xmark.seal.fill")
    }
    
    func testAllCasesHaveImageNames() {
        // This ensures we don't forget to handle new cases
        let onlineStatus = UserStatus.online
        let offlineStatus = UserStatus.offline
        
        XCTAssertFalse(onlineStatus.imageName.isEmpty)
        XCTAssertFalse(offlineStatus.imageName.isEmpty)
    }
}
