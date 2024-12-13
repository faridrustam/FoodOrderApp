//
//  MainMenuViewModel.swift
//  FoodOrderApp
//
//  Created by Farid Rustamov on 11.12.24.
//

import Foundation
import UIKit

class MainMenuViewModel {
    
    var categories = [CategoryModel]()
    
    func getCategoryList(completion: (() -> Void)) {
        if let fileUrl = Bundle.main.url(forResource: "Category", withExtension: "json") {
            do {
                let data = try Data(contentsOf: fileUrl)
                categories = try JSONDecoder().decode([CategoryModel].self, from: data)
                completion()
            } catch {
                print(error.localizedDescription)
            }
        }
    }
    
}
