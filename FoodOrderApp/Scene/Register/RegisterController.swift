//
//  RegisterController.swift
//  FoodOrderApp
//
//  Created by Farid Rustamov on 07.12.24.
//

import UIKit
import Lottie

class RegisterController: UIViewController {
    
    let viewModel = RegisterViewModel()
    
    @IBOutlet private weak var registerAnimationView: LottieAnimationView!
    @IBOutlet private weak var fullnameTextField: UITextField!
    @IBOutlet private weak var emailTextField: UITextField!
    @IBOutlet private weak var birthdateTextField: UITextField!
    @IBOutlet private weak var passwordTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }
    
    func configureUI() {
        title = "Register"
        emailTextField.keyboardType = .emailAddress
        birthdateTextField.keyboardType = .numberPad
        passwordTextField.isSecureTextEntry = true
        registerAnimationView.play()
        registerAnimationView.loopMode = .playOnce
    }
    
    @IBAction func registerTapped(_ sender: Any) {
        if let fullname = fullnameTextField.text, !fullname.isEmpty, let email = emailTextField.text, !email.isEmpty, let birthdate = birthdateTextField.text, !birthdate.isEmpty, let password = passwordTextField.text, !password.isEmpty {
            
            let user: UserModel = (.init(fullname: fullname, email: email, birthdate: birthdate, password: password))
            viewModel.userDefaultsManager.setValue(value: email, key: .email)
            viewModel.users.append(user)
            viewModel.registerCallBack?(user)
            viewModel.fileManagerHelper.writeData(user: viewModel.users)
            showAlert(title: "Success", message: "You have registered successfully")
            Timer.scheduledTimer(withTimeInterval: 2, repeats: false) { _ in
                self.navigationController?.popViewController(animated: true)
            }
        }
    }
}

extension RegisterController {
    func showAlert(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        present(alert, animated: true, completion: nil)
    }
}
