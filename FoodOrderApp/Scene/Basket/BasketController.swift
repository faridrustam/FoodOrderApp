//
//  BasketController.swift
//  FoodOrderApp
//
//  Created by Farid Rustamov on 13.12.24.
//

import UIKit

class BasketController: UIViewController {

    @IBOutlet private weak var basketTableView: UITableView!
    @IBOutlet private weak var footerView: UIView!
    @IBOutlet private weak var totalPriceLabel: UILabel!
    
    let viewModel = BasketViewModel()
    let indentifer = "\(BasketCell.self)"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        updatePrice()
        calculateTotalPrice()
    }
    
    func configureUI() {
        basketTableView.dataSource = self
        basketTableView.delegate = self
        title = "Basket"
        viewModel.readData()
        basketTableView.register(UINib(nibName: indentifer, bundle: nil), forCellReuseIdentifier: indentifer)
    }
    
    func updatePrice() {
        if viewModel.basketFoods.isEmpty {
            totalPriceLabel.text = "You have no food in basket"
        } else {
            totalPriceLabel.text = "Total Price: \(viewModel.totalPrice)$"
        }
    }
    
    func calculateTotalPrice() {
            viewModel.totalPrice = viewModel.basketFoods.reduce(0) { $0 + ($1.foodPrice ?? 0) * ($1.foodCount ?? 1) }
            updatePrice()
    }
}

extension BasketController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.basketFoods.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: indentifer, for: indexPath) as! BasketCell
        let data = viewModel.basketFoods[indexPath.row]
        let price = (data.foodPrice ?? 0) * (data.foodCount ?? 1)
        cell.callElement(foodImage: data.foodImage ?? "",
                         foodName: data.foodName ?? "",
                         foodPrice: price,
                         count: data.foodCount ?? 1)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            let deletedItemPrice = viewModel.basketFoods[indexPath.row].foodPrice ?? 0
            let quantity = viewModel.basketFoods[indexPath.row].foodCount ?? 1
            
                if quantity > 1 {
                    viewModel.basketFoods[indexPath.row].foodCount = quantity - 1
                    print(viewModel.basketFoods)
                    viewModel.totalPrice -= deletedItemPrice
                } else {
                    viewModel.totalPrice -= deletedItemPrice
                    viewModel.basketFoods.remove(at: indexPath.row)
                    tableView.deleteRows(at: [indexPath], with: .fade)
                }
                updatePrice()
                viewModel.fileManagerHelper.writeBasketData(basket: viewModel.basketFoods)
                tableView.reloadData()
            }
        }
}
