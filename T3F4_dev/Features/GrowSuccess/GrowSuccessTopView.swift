//
//  GrowSuccessTopView.swift
//  T3F4_dev
//
//  Created by 양승완 on 5/18/25.
//

import SwiftUI


struct GrowSuccessTopView: View {
    
    @ObservedObject var viewModel: GrowSuccessVM
    
    var body: some View {
        VStack(alignment: .center) {
            Spacer().frame(height: 40)
            Image("SuccesGrow")
            Spacer().frame(height: 24)
            Text("새싹이 성장 완료 💚").font(AppFont.heading_Medium_bold.font)
            Text(viewModel.growedTime).font(AppFont.body_medium_medium.font)
            Spacer().frame(height: 24)
            VStack(alignment: .center, spacing: 2) {
                Spacer().frame(height: 16)
                
                Text("챌싹이 '\(viewModel.babyName)'이름으로 그린피스의").font(AppFont.body_small_light.font)
                HStack(spacing: 0) {
                    Text("#BreakFreeFromPlastic 캠페인").font(AppFont.body_small_bold.font)
                    Text("에").font(AppFont.body_small_light.font)
                }
                
                Text("1000원을 후원했습니다.").font(AppFont.body_small_light.font)
                Spacer().frame(height: 16)
                
            }.frame(maxWidth: .infinity).background(Color(R.Color.neutral_10.rawValue)).clipShape(.rect(cornerRadius: 8)).padding(.horizontal)
            
            Spacer().frame(height: 32)
            
        }.background(Color(R.Color.neutral_white.rawValue))
            .clipShape(.rect(cornerRadius: 18)).padding(.horizontal)
        
    }
}

