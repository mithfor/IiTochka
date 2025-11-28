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
        
        // TODO: - Apply identifiable VideoCardsViewModel here
        @State var videoCards = [1,2,3,4,5]
        NavigationView {
            ZStack {
                
                Color.black
                    .ignoresSafeArea()
                
                ScrollView() {
                    LazyVStack (spacing: 12) {
                        ForEach(videoCards, id: \.self) { card in
                            
                            // TODO: - Extract to Navigation View
                            NavigationLink(destination: DetailsVideoCardView(videoCardNumber: card)) {
                                VideoCardView()
                            }
                            .buttonStyle(PlainButtonStyle())
                        }
                    }
                    .padding(.leading)
                    .padding(.trailing)
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
