//
//  TodayChallengeView.swift
//  T3F4_dev
//
//  Created by 양승완 on 5/17/25.
//

import SwiftUI

struct TodayChallengeView: View {
    
    @ObservedObject var viewModel: ChallengeVM
    
    var body: some View {
        VStack(spacing: 0) {
            HStack {
                    Text("하루 챌린지")
                    Spacer()
                    HStack(spacing: 8) {
                      Text("1")
                        .foregroundStyle(Color(R.Color.primary_default.rawValue))
                      Text("/")
                      Text("2")
                    }
                  }
                  .padding(EdgeInsets(top: 20, leading: 16, bottom: 20, trailing: 16))
                  .background(Color(R.Color.neutral_10.rawValue))
                  .clipShape(.rect(cornerRadius: 16))
            
            VStack(spacing: 4) {
                ForEach(viewModel.todayModels, id: \.self) { challenge in
                    ChallengeRow(name: challenge.name, status: challenge.status, itemType: challenge.itemType)
                   
                }
            }.padding(.top, 8)
        }
        .padding(.all).background(Color.white).cornerRadius(20)
    }
}

