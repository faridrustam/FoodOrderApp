//
//  ProfileController.swift
//  FoodOrderApp
//
//  Created by Farid Rustamov on 10.12.24.
//

import UIKit
import Lottie

class ProfileController: UIViewController {
    
    let userDefaultsManager = UserDefaultsManager()
    
    @IBOutlet weak var profileAnimationView: LottieAnimationView!
    @IBOutlet weak var fullnameLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var birthdateLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Profile"
        profileAnimationView.play()
        profileAnimationView.loopMode = .loop
        
        if let fullname = userDefaultsManager.getValue(key: .fullname), let email = userDefaultsManager.getValue(key: .email), let birthdate = userDefaultsManager.getValue(key: .birthdate) {
            fullnameLabel.text = "Fullname: \(fullname)"
            emailLabel.text = "Email: \(email)"
            birthdateLabel.text = "Birthdate: \(birthdate)"
        }
    }

}
