//
//  VideoCardView.swift
//  IiTochka
//
//  Created by Dmitrii Voronin on 19.11.2025.
//

import SwiftUI

struct VideoCardView: View {
    
    let configuration: Configuration
    
    let footerViewModel = DefaultFooterViewModelFactory()
        .makeFooterViewModel(location: "Penza, Russia",
                             views: "144",
                             hearts: "1B")
    
    init(configuration: Configuration = .default) {
        self.configuration = configuration
    }
    
    struct Configuration {
        let cornerRadius: CGFloat
        let borderWidth: CGFloat
        let borderColor: Color
        let backgroundColor: Color
        
        static let `default` = Configuration(
            cornerRadius: 10,
            borderWidth: 2,
            borderColor: .black,
            backgroundColor: .black
        )
    }

    var body: some View {

        ZStack {
            VideoCardBackgroundView()
                .clipShape(.rect(cornerRadius: configuration.cornerRadius))
                .overlay(RoundedRectangle(cornerRadius: configuration.cornerRadius)
                    .stroke(configuration.borderColor, lineWidth: configuration.borderWidth))
            
            VStack {
                HeaderView()
                    .padding()
                Spacer()
                TagsViewContainer()
                    .padding(.horizontal)
                FooterView(viewModel: footerViewModel)
                    .padding(.horizontal)
                    .padding(.bottom)
            }
        }
        .background(configuration.backgroundColor)
        .padding(.top)
    }
}



#Preview {
    VideoCardView()
}


