//
//  GrowSuccessView.swift
//  T3F4_dev
//
//  Created by 양승완 on 5/17/25.
//

import SwiftUI

struct GrowSuccessView: View {
    
    @StateObject var viewModel = GrowSuccessVM()
    
    var body: some View {
        ScrollView {
            
            GrowSuccessTopView(viewModel: viewModel)
            Spacer().frame(height: 24)
            GrowSuccessBottomView(viewModel: viewModel)
        }.background(Color(R.Color.neutral_10.rawValue))
    }
}

class GrowSuccessVM: ObservableObject {
    @Published var growedTime = ""
    @Published var userName = ""
    @Published var babyName = ""
    
    
}
