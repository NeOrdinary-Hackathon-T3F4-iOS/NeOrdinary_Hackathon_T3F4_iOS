//
//  ChallengeView.swift
//  T3F4_dev
//
//  Created by 양승완 on 5/17/25.
//

import SwiftUI



struct ChallengeView: View {
    
    @StateObject private var viewModel = ChallengeVM()
    
    // MARK: - UI
    private enum UI {
        static let contentSpacing: CGFloat = 16
    }
    
    // MARK: - View
    var body: some View {
        ScrollView {
            VStack(spacing: 10) {
                
                TodayChallengeView(viewModel: viewModel)
                WeeklyChallengeView(viewModel: viewModel)
                
            }.padding(.horizontal, UI.contentSpacing)
            
        }.background(Color(R.Color.neutral_20.rawValue)).onAppear {
            
        }.onAppear() {
            viewModel.onAppear()
        }
        
        
    }
}

