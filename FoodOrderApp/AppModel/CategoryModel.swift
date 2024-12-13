//
//  AppModel.swift
//  FoodOrderApp
//
//  Created by Farid Rustamov on 07.12.24.
//

import Foundation

struct CategoryModel: Codable {
    let categoryName: String?
    let categoryImage: String?
    let foods: [FoodModel]?
}

struct FoodModel: Codable {
    let foodName: String?
    let foodPrice: String?
    let foodImage: String?
}
