//
//  FoodsMenuViewModel.swift
//  FoodOrderApp
//
//  Created by Farid Rustamov on 11.12.24.
//

import Foundation

class FoodsMenuViewModel {
    
    var foods = [FoodModel]()
    var titleString = ""
    var basketFoods = [FoodModel]()
    let fileManagerHelper = FileManagerHelper()
    
//    func addFoodToBasket(food: FoodModel) {
//        if !selectedFoods.contains(where: { $0.foodName == food.foodName }) {
//                selectedFoods.append(food)
//                print("\(food.foodName ?? "Unknown") added to cart")
//            } else {
//                print("\(food.foodName ?? "Unknown") is already in the cart!")
//            }
//        }
    
    func saveItemToBasket(index: Int) {
        basketFoods.append(foods[index])
        fileManagerHelper.writeBasketData(basket: basketFoods)
    }
    
    func getFilePath(fileName: FileName) -> URL  {
        let files = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        let path = files[0].appendingPathComponent(fileName.rawValue)
        print(path)
        return path
    }
}
