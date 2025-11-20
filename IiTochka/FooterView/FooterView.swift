//
//  FooterView.swift
//  IiTochka
//
//  Created by Dmitrii Voronin on 19.11.2025.
//

import SwiftUI
import Combine





struct FooterView: View {
    
    @StateObject private var viewModel: FooterViewModel
    
    init(viewModel: FooterViewModel) {
        _viewModel = StateObject(wrappedValue: viewModel)
    }
    
    init(factory: FooterViewModelFactory, location: String, views: String, hearts: String) {
        self.init(viewModel: factory.makeFooterViewModel(location: location, views: views, hearts: hearts))
    }
    
    var body: some View {
        HStack(alignment: .top, spacing: 6) {
           locationView
            Spacer()

            viewsView
            heartsView
        }
    }
    
    private var locationView: some View {
        HStack {
            Image(.mappin)
                .footerStyle()
            Text(viewModel.location)
                .footerTextStyle()
        }
    }
    
    private var viewsView: some View {
        HStack {
            Image(systemName: "eye")
                .footerStyle()
            Text(viewModel.views)
                .footerTextStyle()
        }
    }
    
    private var heartsView: some View {
        HStack {
            Image(systemName: "heart")
                .footerStyle()
                
            Text(viewModel.hearts)
                .footerTextStyle()
        }
    }
}

struct FooterViewTextStyle: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.system(size: 12, weight: .medium))
            .foregroundStyle(Color.white)
    }
}

extension View {
    func footerTextStyle() -> some View {
        modifier(FooterViewTextStyle())
    }
}

extension Image {
    func footerStyle() -> some View {
        self
            .renderingMode(.template)
            .foregroundStyle(.white)
            .frame(width: 14, height: 14)
    }
}

#Preview {
    let factory = DefaultFooterViewModelFactory()
    return FooterView(factory: factory,
                      location: "Penza",
                      views: "14", hearts: "1B")
}
