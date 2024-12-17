//
//  ProfileController.swift
//  FoodOrderApp
//
//  Created by Farid Rustamov on 10.12.24.
//

import UIKit
import Lottie

class ProfileController: UIViewController {
    
    let viewModel = ProfileViewModel()
    
    @IBOutlet private weak var profileAnimationView: LottieAnimationView!
    @IBOutlet private weak var fullnameLabel: UILabel!
    @IBOutlet private weak var emailLabel: UILabel!
    @IBOutlet private weak var birthdateLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }
        func configureUI() {
            title = "Profile"
            profileAnimationView.play()
            profileAnimationView.loopMode = .loop
            viewModel.fileManagerHelper.readData { usersData in
                self.viewModel.users = usersData
            }
            
            let user = viewModel.users.first{ $0.email == viewModel.userDefaultsManager.getValue(key: .email) }
            
            if let fullname = user?.fullname, let email = user?.email, let birthdate = user?.birthdate {
                if viewModel.users.contains(where: {$0.email == viewModel.userDefaultsManager.getValue(key: .email)} ) {
                    fullnameLabel.text = "Fullname: \(fullname)"
                    emailLabel.text = "Email: \(email)"
                    birthdateLabel.text = "Birthdate: \(birthdate)"
                }
            }
        }
}
