//
//  UserStatus.swift
//  InteresnoITochkaNew
//
//  Created by Dmitrii Voronin on 19.11.2025.
//


enum UserStatus {
    case online
    case offline
    
    var imageName: String {
        switch self {
            case .online:
                return "checkmark.seal.fill"
            case .offline:
                return "xmark.seal.fill"
        }
    }
}