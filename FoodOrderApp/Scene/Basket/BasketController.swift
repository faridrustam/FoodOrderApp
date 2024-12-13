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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        basketTableView.dataSource = self
        basketTableView.delegate = self
        viewModel.readData()
        basketTableView.register(UINib(nibName: "\(BasketCell.self)", bundle: nil), forCellReuseIdentifier: "\(BasketCell.self)")
    }
}

extension BasketController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.selectedFoods.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "\(BasketCell.self)", for: indexPath) as! BasketCell
        cell.callElement(foodImage: viewModel.selectedFoods[indexPath.row].foodImage ?? "", foodName: viewModel.selectedFoods[indexPath.row].foodName ?? "", foodPrice: viewModel.selectedFoods[indexPath.row].foodPrice ?? "")
        
        return cell
    }
}
