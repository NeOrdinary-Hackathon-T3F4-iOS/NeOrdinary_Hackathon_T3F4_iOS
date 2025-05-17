//
//  APIImageUpload.swift
//  T3F4_dev
//
//  Created by 양승완 on 5/18/25.
//

import UIKit
import Alamofire


class APIImageUpload {
    
    static let shared = APIImageUpload()
    
    private init() {}
//    "http://43.201.72.196:8080/"
    //    /api/missions/{missionId}/progress/{memberUuid}
    
    func uploadImageWithParams(
        image: UIImage,
        params: [String: String],
        to url: String,
        completion: @escaping (Result<String, Error>) -> Void
    ) {
        guard let imageData = image.jpegData(compressionQuality: 0.8) else {
            completion(.failure(NSError(domain: "InvalidImage", code: -1, userInfo: [NSLocalizedDescriptionKey: "이미지를 JPEG 데이터로 변환 실패"])))
            return
        }
        
        AF.upload(multipartFormData: { multipartFormData in
            // 이미지 추가
            multipartFormData.append(imageData, withName: "file", fileName: "photo.jpg", mimeType: "image/jpeg")
            
            // 파라미터 추가
            for (key, value) in params {
                if let data = value.data(using: .utf8) {
                    multipartFormData.append(data, withName: key)
                }
            }
        }, to: url)
        .validate()
        .response { response in
            switch response.result {
            case .success(let data):
                if let data = data, let responseString = String(data: data, encoding: .utf8) {
                    completion(.success(responseString))
                } else {
                    completion(.failure(NSError(domain: "NoData", code: -2, userInfo: [NSLocalizedDescriptionKey: "응답 데이터 없음"])))
                }
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}
