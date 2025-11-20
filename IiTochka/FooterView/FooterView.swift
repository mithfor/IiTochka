//
//  FooterView.swift
//  IiTochka
//
//  Created by Dmitrii Voronin on 19.11.2025.
//

import SwiftUI

struct FooterView: View {
    var body: some View {
        HStack(alignment: .top, spacing: 6) {
            HStack {
                Image(.mappin)
                    .footerStyle()
                Text("Россия, Сочи")
                    .footerTextStyle()
            }
            Spacer()
            HStack {
                Image(systemName: "eye")
                    .footerStyle()
                Text("567")
                    .footerTextStyle()
            }
            
            HStack {
                Image(systemName: "heart")
                    .footerStyle()
                    
                Text("1.5k")
                    .footerTextStyle()
            }
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
