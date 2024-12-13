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
    @IBOutlet weak var sameFoodCountLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func callElement(foodImage: String, foodName: String, foodPrice: String, count: String = "1") {
        foodNameLabel.text = foodName
        basketImageView.image = UIImage(named: foodImage)
        foodPriceLabel.text = "\(foodPrice)$"
        sameFoodCountLabel.text = "count: \(count)"
    }
    
}
