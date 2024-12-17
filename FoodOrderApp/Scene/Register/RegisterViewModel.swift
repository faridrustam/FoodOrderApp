//
//  RegisterViewModel.swift
//  FoodOrderApp
//
//  Created by Farid Rustamov on 17.12.24.
//

import Foundation

class RegisterViewModel {
    
    var users = [UserModel]()
    let userDefaultsManager = UserDefaultsManager()
    let fileManagerHelper = FileManagerHelper()
    var registerCallBack: ((UserModel) -> Void)?
    
}
