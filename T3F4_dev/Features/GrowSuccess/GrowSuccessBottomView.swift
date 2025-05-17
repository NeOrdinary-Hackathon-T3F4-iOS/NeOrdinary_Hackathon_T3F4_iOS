//
//  GrowSuccessBottomView.swift
//  T3F4_dev
//
//  Created by 양승완 on 5/18/25.
//

import SwiftUI

struct GrowSuccessBottomView: View {
    
    @ObservedObject var viewModel: GrowSuccessVM
    
    var body: some View {
        VStack(alignment: .center) {
            Spacer().frame(height: 32)
            Text("정성으로 키워주신").font(AppFont.body_medium_bold.font)
            Text("새싹이는 샴푸바로 성장했어요!").font(AppFont.body_medium_bold.font)
            
            Spacer().frame(height: 24)
            
            Image("shampooBar").frame(maxWidth: .infinity).padding(.horizontal)

            Spacer().frame(height: 24)

            VStack(alignment: .center, spacing: 2) {
                Spacer().frame(height: 16)
                
                Text("샴푸바 캐릭터를 2개만 더 모으면,").font(AppFont.body_small_bold.font)
                Text("톤28의 미니 샴푸바를 받을 수 있어요").font(AppFont.body_small_bold.font)

                Spacer().frame(height: 8)
                
                Text("앞으로도 화이팅 해봅시다!").font(AppFont.body_small_light.font)
                Spacer().frame(height: 16)
                
            }.frame(maxWidth: .infinity).background(Color(R.Color.neutral_10.rawValue)).clipShape(.rect(cornerRadius: 8)).padding(.horizontal)
            
            Spacer().frame(height: 32)
            
        }.background(Color(R.Color.neutral_white.rawValue))
            .clipShape(.rect(cornerRadius: 18)).padding(.horizontal)
        
    }
}
