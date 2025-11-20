//
//  ContentView.swift
//  InteresnoITochkaIOS
//
//  Created by Dmitrii Voronin on 19.11.2025.
//

import SwiftUI
import Combine

struct ContentView: View {
    var body: some View {
        ScrollView(.vertical) {
            VideoCardView()
            VideoCardView()
            VideoCardView()
        }
        .background(Color.black)
    }
}

#Preview {
    ContentView()
}
