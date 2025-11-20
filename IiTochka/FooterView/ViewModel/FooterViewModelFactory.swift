//
//  FooterViewModelFactory.swift
//  IiTochka
//
//  Created by Dmitrii Voronin on 20.11.2025.
//

import Foundation

protocol FooterViewModelFactory {
    func makeFooterViewModel(location: String, views: String, hearts: String) -> FooterViewModel
}

class DefaultFooterViewModelFactory: FooterViewModelFactory {
    func makeFooterViewModel(location: String, views: String, hearts: String) -> FooterViewModel {
        FooterViewModel(location: location, views: views, hearts: hearts)
    }
}
