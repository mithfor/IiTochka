//
//  VideoCardBackgroundView.swift
//  IiTochka
//
//  Created by Dmitrii Voronin on 19.11.2025.
//

import SwiftUI

struct VideoCardBackgroundView: View {
    var body: some View {
        Image(.mockBackground)
            .resizable()
            .aspectRatio(contentMode: .fit)
    }
}
