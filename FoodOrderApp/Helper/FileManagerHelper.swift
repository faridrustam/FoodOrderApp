//
//  FileManagerHelper.swift
//  FoodOrderApp
//
//  Created by Farid Rustamov on 09.12.24.
//

import Foundation

enum FileName: String {
    case users = "Users.json"
    case basket = "Basket.json"
}

class FileManagerHelper {
    
    func getFilePath(fileName: FileName = .users) -> URL  {
        let files = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        let path = files[0].appendingPathComponent(fileName.rawValue)
        print(path)
        return path
    }
    
    func writeData(user: [UserModel]) {
        do {
            let data = try JSONEncoder().encode(user)
            let path = getFilePath()
            try data.write(to: path)
        } catch {
            print(error.localizedDescription)
        }
    }
    
    func readData(completion: (([UserModel]) -> Void)) {
        if let data = try? Data(contentsOf: getFilePath()) {
            do {
                let users = try JSONDecoder().decode([UserModel].self, from: data)
                completion(users)
            } catch {
                print(error.localizedDescription)
            }
        }
    }
    
    func writeBasketData(basket: [FoodModel]) {
        do {
            let data = try JSONEncoder().encode(basket)
            let path = getFilePath(fileName: .basket)
            try data.write(to: path)
        } catch {
            print(error.localizedDescription)
        }
    }
    
    func readBasketData(completion: (([FoodModel]?) -> Void)) {
        if let data = try? Data(contentsOf: getFilePath(fileName: .basket)) {
            do {
                let basket = try JSONDecoder().decode([FoodModel].self, from: data)
                completion(basket)
            } catch {
                print(error.localizedDescription)
            }
        } else {
                completion(nil)
            }
        }
    }
