//
//  ProfileViewModel.swift
//  FoodOrderApp
//
//  Created by Farid Rustamov on 17.12.24.
//

import Foundation

class ProfileViewModel {
    let userDefaultsManager = UserDefaultsManager()
    let fileManagerHelper = FileManagerHelper()
    var users = [UserModel]()
}
