//
//  LoginViewModel.swift
//  FoodOrderApp
//
//  Created by Farid Rustamov on 11.12.24.
//

import Foundation
import UIKit

class LoginViewModel {
    
    private let userDefaultsManager = UserDefaultsManager()
    private let fileManagerHelper = FileManagerHelper()
    var users = [UserModel]()
    var success: (() -> Void)?
    var error: (() -> Void)?
    
    
    func readData() {
        fileManagerHelper.readData { usersData in
            self.users = usersData
        }
    }
    
    func checkData(email: String, password: String) {
        if users.contains(where: { $0.email == email && $0.password == password }) {
            userDefaultsManager.setValue(value: true, key: .loginCheck)
            success?()
        } else {
            error?()
        }
    }
}
