//
//  VideoCardView.swift
//  IiTochka
//
//  Created by Dmitrii Voronin on 19.11.2025.
//

import SwiftUI

struct VideoCardView: View {
    var body: some View {

        ZStack(alignment: .topLeading) {
            VideoCardBackgroundView()
            
            HeaderView()
                .padding()
        }
    }
}

#Preview {
    VideoCardView()
}

struct VideoCardBackgroundView: View {
    var body: some View {
        Image(.mockBackground)
            .resizable()
            .aspectRatio(contentMode: .fit)
    }
}
