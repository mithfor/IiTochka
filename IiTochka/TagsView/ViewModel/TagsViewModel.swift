//
//  TagsViewModel.swift
//  IiTochka
//
//  Created by Dmitrii Voronin on 21.11.2025.
//

import SwiftUI
import Combine

final class TagsViewModel: ObservableObject {
    
    @Published var tags: [TagViewItem]
    
    init(tags: [TagViewItem] = []) {
        self.tags = tags
    }
    
    // MARK: - default tags
    static var defaultTags: [TagViewItem] = [
        TagViewItem(title: "#Португалия", isSelected: false),
        TagViewItem(title: "#Природа", isSelected: false),
        TagViewItem(title: "#Лето", isSelected: false),
    ]
    
    // TODO: - Add tag tapping functionality
}


