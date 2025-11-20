//
//  HeaderViewModel.swift
//  InteresnoITochkaNew
//
//  Created by Dmitrii Voronin on 19.11.2025.
//

import Combine

final class HeaderViewModel: ObservableObject {

    @Published var avatarStatus: String
    @Published var userDescriptionStatus: UserStatus
    
    init(avatarStatus: String, userDescriptionStatus: UserStatus) {
        self.avatarStatus = avatarStatus
        self.userDescriptionStatus = userDescriptionStatus
    }
}
