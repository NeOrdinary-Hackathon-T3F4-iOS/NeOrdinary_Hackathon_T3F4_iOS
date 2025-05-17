//
//  ScannerContainerView.swift
//  T3F4_dev
//
//  Created by 양승완 on 5/18/25.
//

import SwiftUI

struct ScannerContainerView: UIViewControllerRepresentable {
    @Binding var isPresented: Bool
  let selectedChallenge: ChallengeModel
  let type: MissionType
  
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }

    func makeUIViewController(context: Context) -> ScannerVC {
        print("type \(type) ")

        let vm = ScannerVM(type: type, selectedChallenge: selectedChallenge)
        let vc = ScannerVC(viewModel: vm)
        vm.view = vc

        vc.delegate = context.coordinator  // 연결
        return vc
    }

    func updateUIViewController(_ uiViewController: ScannerVC, context: Context) {
        // 필요 시 업데이트
    }

    class Coordinator: NSObject, ScannerVCDelegate {
   
        
        var parent: ScannerContainerView

        init(_ parent: ScannerContainerView) {
            self.parent = parent
        }

        func scannerDidFinish() {
            // dismiss 트리거
            parent.isPresented = false
        }
    }
}

