//
//  TagsViewModelFactory.swift
//  IiTochka
//
//  Created by Dmitrii Voronin on 21.11.2025.
//


protocol TagsViewModelFactory {
    func makeTagsViewModel(tags: [TagViewItem]) -> TagsViewModel
}

final class DefaultTagsViewModelFactory: TagsViewModelFactory {
    func makeTagsViewModel(tags: [TagViewItem]) -> TagsViewModel {
        TagsViewModel(tags: tags)
    }
}
