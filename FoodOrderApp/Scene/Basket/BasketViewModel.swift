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
    var success: ((Bool) -> Void)?
    
    func readData() {
        fileManagerHelper.readBasketData { readBasket in
            self.basketFoods = readBasket ?? []
        }
    }
    
//    func calculateTotalPrice() {
//            totalPrice = basketFoods.reduce(0) { $0 + ($1.foodPrice ?? 0) * ($1.foodCount ?? 1) }
//            updatePrice()
//    }
//    
//    func updatePrice(element: (() -> Void)) -> Bool {
//        if basketFoods.isEmpty {
//            element.text = "You have no food in basket"
//        } else {
//            element.text = "Total Price: \(viewModel.totalPrice)$"
//        }
//    }
}
