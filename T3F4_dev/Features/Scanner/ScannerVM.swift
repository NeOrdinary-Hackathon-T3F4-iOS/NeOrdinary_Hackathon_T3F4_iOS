//
//  ScannerVM.swift
//  T3F4_dev
//
//  Created by 양승완 on 5/18/25.
//

import UIKit

protocol ScannerView {
    func pop()
    func failAlert()
    func errorAlert(err: String)
}

class ScannerVM {
    
    let selectedChallenge: ChallengeModel
    let type: MissionType
    var view: ScannerView?
    
    init(type: MissionType, view: ScannerView? = nil, selectedChallenge: ChallengeModel) {
        self.type = type
        self.view = view
        self.selectedChallenge = selectedChallenge
    }
    
    func setImageToServcer(img: UIImage, type: MissionType) {
        //TODO: API Request
        let apiKey = ""
//        
        let memberUuid = KeyChainManager.shared.getDeviceIdentifierFromKeychain()!
        let url = "http://43.201.72.196:8080/api/missions/\(selectedChallenge.id)/progress/\(memberUuid)"
        
        
            
            Task {
                print("iuuuuurrrrrrllll \(url)")
                do {
                    let result = try await OpenAIImageEvaluator.shared.evaluateMealImage(image: img, apiKey: apiKey, type: type)
                    if result.success {
                        
                        APIImageUpload.shared.uploadImageWithParams(image: img, params: [:], to: url, completion: { res in
                            switch res {
                            case .success(let success):
                                self.view?.pop()

                            case .failure(let err):
                                self.view?.errorAlert(err: err.localizedDescription)
                            }
                        })
                        
                    } else {
                        self.view?.failAlert()
                    }
                    
                    
                } catch {
                    print("error openAI")
                    self.view?.errorAlert(err: error.localizedDescription)

                }
                
            }
           
        
        
        
        
    }
    
}
