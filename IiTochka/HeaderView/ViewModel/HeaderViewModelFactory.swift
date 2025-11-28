//
//  HeaderViewModelFactory.swift
//  IiTochka
//
//  Created by Dmitrii Voronin on 25.11.2025.
//

import Foundation

protocol HeaderViewModelFactory {
    func makeHeaderViewModel() -> HeaderViewModel
}

final class DefaultHeaderViewModelFactory: HeaderViewModelFactory {
        
    func makeHeaderViewModel() -> HeaderViewModel {
        
        // TODO: - Use Network Provider
        HeaderViewModel(avatarStatus: "Live",
                        userDescriptionStatus: .online
        )
    }
}
