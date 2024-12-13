//  FoodsMenuCell.swift
//  FoodOrderApp
//  Created by Farid Rustamov on 09.12.24.

import UIKit

class FoodsMenuCell: UICollectionViewCell {
    
    @IBOutlet private weak var categoryImageView: UIImageView!
    @IBOutlet private weak var categoryNameLabel: UILabel!
    @IBOutlet private weak var addButton: UIButton!
    
    var buttonAction: (() -> Void)?
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
 
    @IBAction func addButtonTapped(_ sender: Any) {
        buttonAction?()
    }
    
    func callElement(image: String, name: String) {
        categoryNameLabel.text = name
        categoryImageView.image = UIImage(named: image)
    }
    
    func hideButton() {
        addButton.isHidden = true
    }
}
