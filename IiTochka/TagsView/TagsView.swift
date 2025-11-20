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


struct TagsView: View {
    
    @Binding var tags: [TagViewItem]
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(alignment: .center) {
                ForEach(tags, id: \.id) { tag in
                    Text(tag.title)
                        .padding(EdgeInsets(top: 6, leading: 12, bottom: 6, trailing: 12))
                        .background(
                            .black
                            .opacity(0.3)
                        )
                        .blur(radius: 0.15)
                        .clipShape(RoundedRectangle(cornerRadius: 14,
                                                    style: .continuous))
                        .font(.system(size: 13, weight: .regular))
                        .foregroundStyle(Color.white)
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
        TagsView(tags: $tags)
    }
}

#Preview {
    TagsViewContainer()
}
