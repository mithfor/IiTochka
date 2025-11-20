//
//  TagsView.swift
//  IiTochka
//
//  Created by Dmitrii Voronin on 20.11.2025.
//

import SwiftUI

struct TagViewItem: Hashable, Identifiable {
    
    var id = UUID()
    var title: String
    var isSelected: Bool
}

struct TagView: View {
    
    let tag: TagViewItem
    let onTap: (() -> Void)?
    
    init(tag: TagViewItem, onTap: (() -> Void)? = nil) {
        self.tag = tag
        self.onTap = onTap
    }
    
    var body: some View {
        Text(tag.title)
            .padding(EdgeInsets(top: 6, leading: 12, bottom: 6, trailing: 12))
            .background(backgroundView)
            .clipShape(RoundedRectangle(cornerRadius: 14,
                                        style: .continuous
                                       )
            )
            .font(.system(size: 13, weight: .regular))
            .foregroundStyle(Color.white)
            .onTapGesture {
                onTap?()
            }
    }
    
    private var backgroundView: some View {
        Group {
            if tag.isSelected {
                selectedBackgroundColor
            } else {
                backgroundColor
            }
        }
    }
    
    private var selectedBackgroundColor: some View {
        Color.green
            .opacity(0.3)
            .blur(radius: 0.15)
    }
    
    private var backgroundColor: some View {
        Color.black
            .opacity(0.3)
            .blur(radius: 0.15)
    }
}

struct TagsView: View {
    
    @Binding var tags: [TagViewItem]
    var onTagTap: ((TagViewItem) -> Void)?
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(alignment: .center) {
                ForEach(tags, id: \.id) { tag in
                    TagView(tag: tag) {
                        onTagTap?(tag)
                    }
                }
            }
        }
    }
}

struct TagsViewContainer: View {
    
    @State var tags: [TagViewItem] = [
        TagViewItem(title: "#Португалия", isSelected: false),
        TagViewItem(title: "#Природа", isSelected: false),
        TagViewItem(title: "#Лето", isSelected: false),
    ]
    
    var body: some View {
        
        // Multitag sellection
//        TagsView(tags: $tags) { tag in
//            handleTagTap(tag)
//        }
        
        // No tag selection
        TagsView(tags: $tags)
    }
    
    private func handleTagTap(_ tag: TagViewItem) {
        if let index = tags.firstIndex(where: { $0.id == tag.id}) {
            tags[index].isSelected.toggle()
        }
    }
}

#Preview {
    TagsViewContainer()
        .padding()
        .background(Color.gray.opacity(0.1))
}
