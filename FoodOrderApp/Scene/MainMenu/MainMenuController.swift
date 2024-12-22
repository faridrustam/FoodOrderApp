//
//  MainMenuController.swift
//  FoodOrderApp
//
//  Created by Farid Rustamov on 09.12.24.
//

import UIKit

class MainMenuController: UIViewController {

    @IBOutlet private weak var categoryCollection: UICollectionView!
    
    let viewModel = MainMenuViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Home"
        categoryCollection.delegate = self
        categoryCollection.dataSource = self
        categoryCollection.register(UINib(nibName: "\(FoodsMenuCell.self)", bundle: nil), forCellWithReuseIdentifier: "\(FoodsMenuCell.self)")
        viewModel.getCategoryList {
            categoryCollection.reloadData()
        }
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "basket.fill"), style: .plain, target: self, action: #selector(basketTapped))
        self.navigationItem.rightBarButtonItem?.tintColor = .black
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "person.crop.circle.fill"), style: .plain, target: self, action: #selector(profileTapped))
        self.navigationItem.leftBarButtonItem?.tintColor = .black
    }
}

extension MainMenuController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        viewModel.categories.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "\(FoodsMenuCell.self)", for: indexPath) as! FoodsMenuCell
        cell.callElement(image: viewModel.categories[indexPath.row].categoryImage ?? "", name: viewModel.categories[indexPath.row].categoryName ?? "", hideButton: true)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let controller = storyboard?.instantiateViewController(identifier: "\(FoodsMenuController.self)") as! FoodsMenuController
        
        controller.viewModel.titleString = viewModel.categories[indexPath.row].categoryName ?? ""
        
        controller.viewModel.foods = viewModel.categories[indexPath.row].foods ?? []
        navigationController?.show(controller, sender: nil)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        .init(width: categoryCollection.frame.width / 2 - 32, height: 150)
    }
}

extension MainMenuController {
    
    @objc func basketTapped() {
        let controller = storyboard?.instantiateViewController(withIdentifier: "\(BasketController.self)") as! BasketController
        navigationController?.show(controller, sender: nil)
    }
    
    @objc func profileTapped() {
        let controller = storyboard?.instantiateViewController(withIdentifier: "\(ProfileController.self)") as! ProfileController
        navigationController?.show(controller, sender: nil)
    }
}
