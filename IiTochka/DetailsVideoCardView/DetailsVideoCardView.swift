//
//  DetailsVideoCardView.swift
//  IiTochka
//
//  Created by Dmitrii Voronin on 28.11.2025.
//

import SwiftUI

struct DetailsVideoCardView: View {
    
    let videoCardNumber: Int
    
    var body: some View {
        Text("Hello, VideoCard number \(self.videoCardNumber)")
    }
}

#Preview {
    DetailsVideoCardView(videoCardNumber: 1)
}
