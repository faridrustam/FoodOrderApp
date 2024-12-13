//
//  BasketCell.swift
//  FoodOrderApp
//
//  Created by Farid Rustamov on 11.12.24.
//

import UIKit

class BasketCell: UITableViewCell {

    @IBOutlet weak var basketImageView: UIImageView!
    @IBOutlet weak var foodPriceLabel: UILabel!
    @IBOutlet weak var foodNameLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func callElement(foodImage: String, foodName: String, foodPrice: String) {
        foodNameLabel.text = foodName
        basketImageView.image = UIImage(named: foodImage)
        foodPriceLabel.text = foodPrice
    }
    
}
