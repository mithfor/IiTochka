//
//  FooterViewModel.swift
//  IiTochka
//
//  Created by Dmitrii Voronin on 20.11.2025.
//
import SwiftUI
import Combine

class FooterViewModel: ObservableObject {
    @Published var location: String
    @Published var views: String
    @Published var hearts: String
    
    init(location: String, views: String, hearts: String) {
        self.location = location
        self.views = views
        self.hearts = hearts
    }
}
