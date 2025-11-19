//
//  AvatarHeaderView.swift
//  InteresnoITochkaIOS
//
//  Created by Dmitrii Voronin on 19.11.2025.
//

import SwiftUI
import UIKit

struct AvatarHeaderView: View {
    
    @Binding var avatarStatus: String
    var avatarImage: Image
    
    var body: some View {
        ZStack(alignment: .center) {
            avatarImage
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 70, height: 80)
                .clipShape(.rect(cornerRadius: 10))
                .overlay(RoundedRectangle(cornerRadius: 10)
                    .stroke(Color.white, lineWidth: 2))
            
            RoundedRectangle(cornerRadius: 16)
                .fill(Color.red)
                .frame(width: 33, height: 15)
                .overlay {
                    Text(avatarStatus)
                        .font(.system(size: 9, weight: .regular))
                }
                .offset(x: 0, y: 40)
        }
    }
}
