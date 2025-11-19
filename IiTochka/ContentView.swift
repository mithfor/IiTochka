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
                .clipShape(.rect(cornerRadius: 10))
                .overlay(RoundedRectangle(cornerRadius: 10)
                    .stroke(Color.black, lineWidth: 2))
                .padding(.all)
        }
        .background(Color.black)

        
    }
}

#Preview {
    ContentView()
}
