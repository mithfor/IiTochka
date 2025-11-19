//
//  HeaderDescriptionView.swift
//  InteresnoITochkaNew
//
//  Created by Dmitrii Voronin on 19.11.2025.
//

import SwiftUI
import Combine

struct HeaderDescriptionView: View {
    
    var imageName: String
    var tintColor: Color
    var description: String
    var userName: String
    
    var body: some View {
        VStack(alignment: .leading, spacing: 5) {
            HStack(alignment: .top, spacing: 5) {
                Text(userName)
                    .font(.system(size: 14, weight: .medium))
                    .foregroundStyle(Color.white)
                Image(systemName: imageName)
                    .renderingMode(.template)
                    .foregroundStyle(tintColor)
                    .frame(width: 14, height: 14)
            }
            
            Text(description)
                .lineLimit(5)
                .foregroundStyle(Color.white)
                .font(.system(size: 12, weight: .regular))
        }
    }
}
