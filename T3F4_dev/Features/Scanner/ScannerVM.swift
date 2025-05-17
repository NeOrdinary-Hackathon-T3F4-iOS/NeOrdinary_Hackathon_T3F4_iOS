//
//  ScannerVM.swift
//  T3F4_dev
//
//  Created by 양승완 on 5/18/25.
//

import UIKit

protocol ScannerView {
    func stopIndicator()
}

class ScannerVM {

  let type: MissionType
    var view: ScannerView?
  
  init(type: MissionType, view: ScannerView? = nil) {
    self.type = type
    self.view = view
  }

    func setImageToServcer(img: UIImage, type: MissionType) {
        //TODO: API Request
        let apiKey = ""
        
        Task {
            let result = try await OpenAIImageEvaluator.shared.evaluateMealImage(image: img, apiKey: apiKey, type: type)
            
            if result.success {
            } else {
                //error
            }
            view?.stopIndicator()
        }
        
 
        
        
    }
    
}
