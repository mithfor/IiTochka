//
//  VideoCardView.swift
//  IiTochka
//
//  Created by Dmitrii Voronin on 19.11.2025.
//

import SwiftUI

struct VideoCardView: View {
    var body: some View {

        ZStack {
            VideoCardBackgroundView()
                .clipShape(.rect(cornerRadius: 10))
                .overlay(RoundedRectangle(cornerRadius: 10)
                    .stroke(Color.black, lineWidth: 2))
            
            VStack {
                HeaderView()
                    .padding()
                Spacer()
                TagsViewContainer()
                    .padding(.horizontal)
                FooterView()
                    .padding(.horizontal)
                    .padding(.bottom)
            }
        }
        .background(Color.black)
        .padding(.top)
    }
}



#Preview {
    VideoCardView()
}


