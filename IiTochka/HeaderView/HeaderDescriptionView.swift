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
        VStack(alignment: .leading, spacing: 15) {
            HStack(alignment: .top, spacing: 5) {
                Text(userName)
                    .font(.system(size: 11, weight: .medium))
                Image(systemName: imageName)
                    .renderingMode(.template)
                    .foregroundColor(.blue)
                    .frame(width: 14, height: 14)
            }
            
            Text(description)
                .lineLimit(3)
                .foregroundStyle(Color.white)
        }
    }
}
