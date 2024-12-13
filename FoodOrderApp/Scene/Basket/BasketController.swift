//
//  BasketController.swift
//  FoodOrderApp
//
//  Created by Farid Rustamov on 13.12.24.
//

import UIKit

class BasketController: UIViewController {

    @IBOutlet weak var basketTableView: UITableView!
    
    let viewModel = BasketViewModel()
    let indentifer = "\(BasketCell.self)"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }
    
    func configureUI() {
        basketTableView.dataSource = self
        basketTableView.delegate = self
        title = "Basket"
        viewModel.readData()
        basketTableView.register(UINib(nibName: indentifer, bundle: nil), forCellReuseIdentifier: indentifer)
    }
}

extension BasketController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.basketFoods.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: indentifer, for: indexPath) as! BasketCell
        let data = viewModel.basketFoods[indexPath.row]
        cell.callElement(foodImage: data.foodImage ?? "", foodName: data.foodName ?? "", foodPrice: data.foodPrice ?? "")
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            viewModel.basketFoods.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
            viewModel.fileManagerHelper.writeBasketData(basket: viewModel.basketFoods)
        }
    }
}
