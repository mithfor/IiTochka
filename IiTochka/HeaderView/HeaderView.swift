//
//  HeaderView.swift
//  InteresnoITochkaNew
//
//  Created by Dmitrii Voronin on 19.11.2025.
//

import SwiftUI
import Combine

struct HeaderView: View {
    
    @StateObject var viewModel: HeaderViewModel = HeaderViewModel(avatarStatus: "Live",
                                                                  userDescriptionStatus: .online)
    
    var body: some View {
        HStack(alignment: .top, spacing: 16) {
            AvatarHeaderView(avatarStatus: viewModel.avatarStatus,
                             avatarImage: Image(.mockAvatar))
            
            HeaderDescriptionView(imageName: viewModel.userDescriptionStatus.imageName,
                                  tintColor: Color.red,
                                  description: "Водные просторы также впечатляют своей красотой. Вода успокаивает.",
                                  userName: "@kristina")
        }
    }
}
