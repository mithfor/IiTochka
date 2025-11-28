//
//  HeaderViewModel.swift
//  InteresnoITochkaNew
//
//  Created by Dmitrii Voronin on 19.11.2025.
//

import Combine
import SwiftUI



final class HeaderViewModel: ObservableObject {

    @Published var avatarStatus: String
    @Published var userDescriptionStatus: UserStatus
    @Published var avatarImage: Image
    
    init(avatarStatus: String, userDescriptionStatus: UserStatus, avatarImageName: String? = nil) {
        self.avatarStatus = avatarStatus
        self.userDescriptionStatus = userDescriptionStatus
        if let avatarImageName = avatarImageName {
            self.avatarImage = Image(avatarImageName)
        } else {
            self.avatarImage = Image(.mockAvatar)
        }
    }
}
