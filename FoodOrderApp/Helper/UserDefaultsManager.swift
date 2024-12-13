//
//  UserDefaults.swift
//  FoodOrderApp
//
//  Created by Farid Rustamov on 09.12.24.
//

import Foundation

enum UserDefaultsKeys: String, CaseIterable {
    case loginCheck = "isLoggedIn"
    case fullname = "fullname"
    case email = "email"
    case birthdate = "birthdate"
}

class UserDefaultsManager {
    
    func setValue(value: Any, key: UserDefaultsKeys) {
        UserDefaults.standard.setValue(value, forKey: key.rawValue)
    }
    
    func getValue(key: UserDefaultsKeys) -> String? {
        UserDefaults.standard.string(forKey: key.rawValue)
    }
    
    func getBool(key: UserDefaultsKeys) -> Bool {
        UserDefaults.standard.bool(forKey: key.rawValue)
    }
}
