//
//  UserModel.swift
//  FoodOrderApp
//
//  Created by Farid Rustamov on 07.12.24.
//

import Foundation

struct UserModel: Codable {
    let fullname: String?
    let email: String?
    let birthdate: String?
    let password: String?
}
