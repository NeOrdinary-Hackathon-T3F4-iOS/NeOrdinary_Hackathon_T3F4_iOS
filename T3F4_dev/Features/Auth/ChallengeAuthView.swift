//
//  ChallengeAuthView.swift
//  T3F4_dev
//
//  Created by 임경빈 on 5/17/25.
//

import SwiftUI

struct ChallengeAuthView: View {
  
  // MARK: - Properties
  
  let type: ChallengeType
  @Binding private var isPresented: Bool
  
  // MARK: - Initialize
  
  init(type: ChallengeType, isPresented: Binding<Bool>) {
    self.type = type
    self._isPresented = isPresented
  }
  
  // MARK: - View
  
  var body: some View {
    NavigationStack {
      VStack {
        
      }
      .navigationTitle(type.title)
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
