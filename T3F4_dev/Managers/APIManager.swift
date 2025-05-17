//
//  APIManager.swift
//  T3F4_dev
//
//  Created by 양승완 on 5/18/25.
//
import Alamofire
import Foundation
enum Endpoint {
    case members(membersUuids: String)
    case missions(uuid: String)
    case mission(uuid: String, id: String)
    case avatars(memberUuids: String)

    
    // 각 케이스별 URL
    var url: String {
        let base = "http://43.201.72.196:8080/"
        switch self {
        case .members(let membersUuids):
          return base + "api/members/\(membersUuids)"
        case .missions:
            return base + "api/missions"
        case .mission(let uuid, let id):
            return base + "api/missions/\(id)"
        case .avatars(let membersUuids):
            return base + "api/members/\(membersUuids)"
       
        }
    }
    
    // 각 케이스별 HTTP 메서드
    var method: HTTPMethod {
        switch self {
        case .members:
            return .post
        case .avatars, .missions, .mission:
            return .get
        }
    }
    
    // 각 케이스별 파라미터
    var parameters: Parameters? {
        switch self {
        case .members:
          return nil
        case .missions(let uuid):
            return ["uuid": uuid]
        case .mission(let uuid, let id):
            return ["uuid": uuid, "id": id]
        case .avatars(let memberUuids):
            return ["membersUuid": memberUuids]
        }
    }
    
    // GET이면 URL 쿼리, 아니면 JSON body
    var encoding: ParameterEncoding {
        return method == .get ? URLEncoding.default : JSONEncoding.default
    }
}
class APIManager {
    private let base_url: String = "http://43.201.72.196:8080/"

    static let shared = APIManager()
  
  private init() {}
  
    func performRequest(
        _ endpoint: Endpoint,
        headers: HTTPHeaders? = nil,
        completion: @escaping (Result<Data, AFError>) -> Void
    ) {
      print("url: ", endpoint.url)
      print("method: ", endpoint.method)
      print("parameters: ", endpoint.parameters)
        AF.request(
            endpoint.url,
            method: endpoint.method,
            parameters: endpoint.parameters,
            encoding: endpoint.encoding,
            headers: headers
        )
        .validate()
        .responseData { response in
            completion(response.result)
        }
    }
}
