//
//  KeyChainManager.swift
//  T3F4_dev
//
//  Created by 양승완 on 5/17/25.
//

import Security
import Foundation
class KeyChainManager {
    
    static let shared = KeyChainManager()
    
    private init() {}
    
    func saveDeviceIdentifierToKeychain(_ identifier: String) {
        let data = identifier.data(using: .utf8)!
        let query: [String: Any] = [
            kSecClass as String: kSecClassGenericPassword,
            kSecAttrAccount as String: "com.T3F4.-.T3F4-dev",
            kSecValueData as String: data,
            kSecAttrAccessible as String: kSecAttrAccessibleAfterFirstUnlock
        ]
        SecItemAdd(query as CFDictionary, nil)
    }

    func getDeviceIdentifierFromKeychain() -> String? {
        let query: [String: Any] = [
            kSecClass as String: kSecClassGenericPassword,
            kSecAttrAccount as String: "com.T3F4.-.T3F4-dev",
            kSecReturnData as String: true,
            kSecMatchLimit as String: kSecMatchLimitOne
        ]
        var dataTypeRef: AnyObject?
        let status = SecItemCopyMatching(query as CFDictionary, &dataTypeRef)
        
        if status == errSecSuccess, let retrievedData = dataTypeRef as? Data {
            return String(data: retrievedData, encoding: .utf8)
        }
        return nil
    }

}
