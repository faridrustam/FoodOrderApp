//
//  FoodsMenuViewModel.swift
//  FoodOrderApp
//
//  Created by Farid Rustamov on 11.12.24.
//

import Foundation

class FoodsMenuViewModel {
    
    var category: CategoryModel?
    var foods = [FoodModel]()
    var basketFoods = [FoodModel]()
    let fileManagerHelper = FileManagerHelper()
    var titleString = ""
    
    func addFoodToBasket(index: Int) {
        fileManagerHelper.readBasketData { basketItems in
            basketFoods = basketItems ?? []
            if let existingIndex = basketFoods.firstIndex(where: { $0.foodName == foods[index].foodName }) {
                basketFoods[existingIndex].foodCount = (basketFoods[existingIndex].foodCount ?? 1) + 1
                } else {
                    basketFoods.append(foods[index])
                }
            fileManagerHelper.writeBasketData(basket: basketFoods)
            }
        }
}
