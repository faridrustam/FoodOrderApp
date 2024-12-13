//
//  BasketViewModel.swift
//  FoodOrderApp
//
//  Created by Farid Rustamov on 12.12.24.
//

import Foundation

class BasketViewModel {
    let fileManagerHelper = FileManagerHelper()
    var selectedFoods = [FoodModel]()
    
    func readData() {
        fileManagerHelper.readBasketData { readBasket in
            self.selectedFoods = readBasket
        }
    }
}
