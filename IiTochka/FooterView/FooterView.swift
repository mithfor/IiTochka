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
                    .frame(width: 14, height: 14)
                Text("Россия, Сочи")
                    .font(.system(size: 12, weight: .medium))
                    .foregroundStyle(Color.white)
            }
            Spacer()
            HStack {
                Image(systemName: "eye")
                    .renderingMode(.template)
                    .foregroundStyle(.white)
                    .frame(width: 14, height: 14)
                Text("567")
                    .font(.system(size: 12, weight: .medium))
                    .foregroundStyle(Color.white)
                    
            }
            
            HStack {
                Image(systemName: "heart")
                    .renderingMode(.template)
                    .foregroundStyle(.white)
                    .frame(width: 14, height: 14)
                Text("1.5k")
                    .font(.system(size: 12, weight: .medium))
                    .foregroundStyle(Color.white)
            }
        }
    }
}

 
