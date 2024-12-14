//
//  BasketViewModel.swift
//  FoodOrderApp
//
//  Created by Farid Rustamov on 12.12.24.
//

import Foundation

class BasketViewModel {
    let fileManagerHelper = FileManagerHelper()
    var basketFoods = [FoodModel]()
    var totalPrice: Int = 0
    
    func readData() {
        fileManagerHelper.readBasketData { readBasket in
            self.basketFoods = readBasket ?? []
        }
    }
}
