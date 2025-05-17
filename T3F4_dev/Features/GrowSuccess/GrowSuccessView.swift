//
//  GrowSuccessView.swift
//  T3F4_dev
//
//  Created by 양승완 on 5/17/25.
//

import SwiftUI

struct GrowSuccessView: View {
  
  @Environment(\.dismiss)  var dismiss
  @StateObject var viewModel = GrowSuccessVM()
  
  var body: some View {
    NavigationStack {
      ScrollView {
        GrowSuccessTopView(viewModel: viewModel)
        Spacer().frame(height: 24)
        GrowSuccessBottomView(viewModel: viewModel)
      }
      .scrollIndicators(.never)
      .background(Color(R.Color.neutral_10.rawValue))
      .navigationTitle("성장 완료")
      .navigationBarTitleDisplayMode(.inline)
      .toolbar {
        ToolbarItem(placement: .topBarTrailing) {
          Button {
            dismiss()
          } label: {
            Image("x")
          }
        }
      }
      
    }
  }
}

class GrowSuccessVM: ObservableObject {
  @Published var growedTime = ""
  @Published var userName = ""
  @Published var babyName = ""
}
