//
//  ChallengeAuthView.swift
//  T3F4_dev
//
//  Created by 임경빈 on 5/17/25.
//

import SwiftUI

struct ChallengeAuthView: View {
  
  // MARK: - Properties
  
  private var selectedChallenge: ChallengeModel
  let type: MissionType
  @Binding private var isPresented: Bool
  
  // MARK: - Initialize
  
  init(selectedChallenge: ChallengeModel, isPresented: Binding<Bool>) {
    self.selectedChallenge = selectedChallenge
    self._isPresented = isPresented
    type = MissionType(fromTitle: selectedChallenge.name)
  }
  
  // MARK: - View
  
  var body: some View {
    NavigationStack {
      ScrollView {
        VStack(spacing: 24) {
          ChallengeActionInfoView(type: type)
          VStack(spacing: 16) {
            ChallengeAddPhotoView(selectedChallenge: selectedChallenge, type: type)
            ChallengeAuthPhotoSection(isAuthCompleted: false)
            ChallengeAuthPhotoSection(isAuthCompleted: true)
          }
          Spacer()
        }
        .padding(.top, 16)
        .padding(.horizontal, 16)
      }
      .navigationTitle(selectedChallenge.challengeType.title)
      .navigationBarTitleDisplayMode(.inline)
      .toolbar {
        ToolbarItem(placement: .topBarTrailing) {
          Button {
            isPresented = false
          } label: {
            Image("x")
          }
        }
      }
    }
  }
}
