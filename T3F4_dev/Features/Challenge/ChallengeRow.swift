//
//  ChallengeRow.swift
//  T3F4_dev
//
//  Created by 양승완 on 5/17/25.
//

import SwiftUI

enum StatusType {
    case complete
    case nonComplte
    case getAward
}

extension StatusType {
    var title: String {
        switch self {
        case .complete:
            "완료"
        case .nonComplte:
            "미완료"
        case .getAward:
            "보상수령"
        }
    }
    
    var bckColor: Color {
        switch self {
        case .complete:
            Color(R.Color.neutral_70.rawValue)
        case .nonComplte:
            Color(R.Color.neutral_20.rawValue)
        case .getAward:
            Color(R.Color.primary_default.rawValue)
        }
    }
}

struct ChallengeRow: View {
    
    let name: String
    let status: StatusType
    let itemType: ItemType
    
    var body: some View {
        HStack {
            itemType.image.resizable().frame(width: 20,height: 20).scaledToFill()
            Spacer().frame(width: 2)
            Text(name)
            Spacer()
            Text(status.title)
                .frame(width: 64,height: 24)
                .background(status.bckColor)
                .clipShape(.rect(cornerRadius: 8))
            
        }
        .padding(.vertical, 8)
        .background(Color.white).cornerRadius(8)
    }
}

