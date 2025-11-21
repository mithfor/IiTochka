//
//  TagsViewContainer.swift
//  IiTochka
//
//  Created by Dmitrii Voronin on 21.11.2025.
//

import SwiftUI

struct TagsViewContainer: View {
    
    @StateObject private var viewModel: TagsViewModel
    
    init(viewModel: TagsViewModel) {
        _viewModel = StateObject(wrappedValue: viewModel)
    }
    
    init(factory: TagsViewModelFactory, tags: [TagViewItem]) {
        self.init(viewModel: factory.makeTagsViewModel(tags: tags))
    }
    
    var body: some View {
        
        // Multitag selection
//        TagsView(tags: $tags) { tag in
//            handleTagTap(tag)
//        }
        
        // No tag selection
        TagsView(tags: $viewModel.tags)
    }
    
    private func handleTagTap(_ tag: TagViewItem) {
        if let index = viewModel.tags.firstIndex(where: { $0.id == tag.id}) {
            viewModel.tags[index].isSelected.toggle()
        }
    }
}

#Preview {
    TagsViewContainer(viewModel: TagsViewModel(tags: TagsViewModel.defaultTags))
        .padding()
        .background(Color.gray.opacity(0.1))
}
