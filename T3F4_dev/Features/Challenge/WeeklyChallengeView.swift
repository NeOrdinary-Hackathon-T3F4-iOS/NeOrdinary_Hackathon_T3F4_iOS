//
//  WeeklyChallengeView.swift
//  T3F4_dev
//
//  Created by 양승완 on 5/17/25.
//

import SwiftUI

struct WeeklyChallengeView: View {
    
    @ObservedObject var viewModel: ChallengeVM
    
    var body: some View {
        VStack(spacing: 0) {
            ChallengeInfoView(type: .weekly)
 
            VStack( spacing: 4) {
                ForEach(viewModel.weeklyModels, id: \.self) { challenge in
                  Button {
                    if challenge.status == .getAward {
                      withoutAnimation {
                        viewModel.showChallengeAuthSheet(to: challenge)
                      }
                    } else {
                      viewModel.showChallengeAuthSheet(to: challenge)
                    }
                  } label: {
                    ChallengeRow(name: challenge.name, status: challenge.status, itemType: challenge.itemType)
                  }
                  .buttonStyle(.borderless)
                }
            }.padding(.top, 8)
        }.padding(.horizontal).padding(.vertical).background(Color.white).cornerRadius(20)
    }
}

private extension WeeklyChallengeView {
    struct ChallengeInfoView: View {
      
      // MARK: - Properties
      
      let type: ChallengeType
      
      // MARK: - UI
      
      private enum UI {
        static let contentSpacing: CGFloat = 8
        static let contentRadius: CGFloat = 8
        static let contentPadding = EdgeInsets(top: 20, leading: 16, bottom: 20, trailing: 16)
        static let backgroundColor = Color(R.Color.primary_subtle.rawValue)
      }
      
      // MARK: View
      
      var body: some View {
        HStack {
          Text(type.title)
            .font(AppFont.body_medium_medium.font)
            .foregroundStyle(Color(R.Color.neutral_black.rawValue))
          Spacer()
          HStack(spacing: UI.contentSpacing) {
            Text("1")
              .font(AppFont.heading_Medium_bold.font)
              .foregroundStyle(Color(R.Color.primary_default.rawValue))
            Text("/")
              .font(AppFont.body_medium_medium.font)
              .foregroundStyle(Color(R.Color.neutral_90.rawValue))
            Text("2")
              .font(AppFont.body_large_bold.font)
              .foregroundStyle(Color(R.Color.neutral_90.rawValue))
          }
        }
        .padding(UI.contentPadding)
        .background(Color(R.Color.neutral_10.rawValue))
        .clipShape(.rect(cornerRadius: UI.contentRadius))
      }
    }
    
    struct MotivationLabel: View {
      
      // MARK: - UI
      
      private enum UI {
        static let contentPadding: CGFloat = 8
        static let contentRadius: CGFloat = 8
        static let backgroundColor = Color(R.Color.primary_subtle.rawValue)
      }
      
      // MARK: View
      
      var body: some View {
        Text("오늘도 힘내서 제로 웨이스트 실천해보아요")
          .font(AppFont.body_small_light.font)
          .foregroundStyle(.black)
          .frame(maxWidth: .infinity)
          .padding(UI.contentPadding)
          .background(UI.backgroundColor)
          .clipShape(.rect(cornerRadius: UI.contentRadius))
      }
    }
  }
