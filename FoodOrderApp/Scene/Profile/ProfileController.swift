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
    let fileManagerHelper = FileManagerHelper()
    var users = [UserModel]()
    
    @IBOutlet weak var profileAnimationView: LottieAnimationView!
    @IBOutlet weak var fullnameLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var birthdateLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        
    }
        func configureUI() {
            title = "Profile"
            profileAnimationView.play()
            profileAnimationView.loopMode = .loop
            fileManagerHelper.readData { usersData in
                self.users = usersData
            }
            
            let user = users.first{ $0.email == userDefaultsManager.getValue(key: .email) }
            
            if let fullname = user?.fullname, let email = user?.email, let birthdate = user?.birthdate {
                if users.contains(where: {$0.email == userDefaultsManager.getValue(key: .email)} ) {
                    fullnameLabel.text = "Fullname: \(fullname)"
                    emailLabel.text = "Email: \(email)"
                    birthdateLabel.text = "Birthdate: \(birthdate)"
                }
            }
    }
}
