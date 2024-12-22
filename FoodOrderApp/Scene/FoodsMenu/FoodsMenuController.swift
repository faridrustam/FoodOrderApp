//
//  FoodsMenuController.swift
//  FoodOrderApp
//
//  Created by Farid Rustamov on 09.12.24.
//

import UIKit

class FoodsMenuController: UIViewController {
    
    let viewModel = FoodsMenuViewModel()
    
    @IBOutlet private weak var foodsMenuCollectionView: UICollectionView!

    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }
    
    private func configureUI() {
        title = viewModel.titleString
        foodsMenuCollectionView.delegate = self
        foodsMenuCollectionView.dataSource = self
        foodsMenuCollectionView.register(UINib(nibName: "\(FoodsMenuCell.self)", bundle: nil), forCellWithReuseIdentifier: "\(FoodsMenuCell.self)")
    }
}

extension FoodsMenuController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        viewModel.foods.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "\(FoodsMenuCell.self)", for: indexPath) as! FoodsMenuCell
        cell.callElement(image: viewModel.foods[indexPath.row].foodImage ?? "", name: viewModel.foods[indexPath.row].foodName ?? "")
        cell.buttonAction = {
            self.viewModel.addFoodToBasket(index: indexPath.row)
            }
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        .init(width: foodsMenuCollectionView.frame.width / 2 - 32, height: 150)
    }
}
