//
//  LoginController.swift
//  FoodOrderApp
//
//  Created by Farid Rustamov on 07.12.24.
//

import UIKit
import Lottie

class LoginController: UIViewController {
    
    @IBOutlet private weak var animationView: LottieAnimationView!
    @IBOutlet private weak var emailTextField: UITextField!
    @IBOutlet private weak var passwordTextField: UITextField!
    
    let viewModel = LoginViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        configureModelView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        viewModel.readData()
    }
    
    func configureUI() {
        title = "Login"
        animationView.play()
        animationView.loopMode = .loop
        emailTextField.keyboardType = .emailAddress
        passwordTextField.isSecureTextEntry = true
    }
    
    func configureModelView() {
        viewModel.success = {
            let controller = self.storyboard?.instantiateViewController(withIdentifier: "\(MainMenuController.self)") as! MainMenuController
            self.navigationController?.show(controller, sender: nil)
        }
        viewModel.error = {
            let alertController = UIAlertController(title: "Error", message: "You entered wrong email or password", preferredStyle: .alert)
            let action = UIAlertAction(title: "OK", style: .default)
            alertController.addAction(action)
            self.present(alertController, animated: true)
        }
    }
    
    @IBAction func loginTapped(_ sender: Any) {
        if let email = emailTextField.text, let password = passwordTextField.text {
            viewModel.checkData(email: email, password: password)
        }
    }
    
    @IBAction func registerTapped(_ sender: Any) {
        let controller = storyboard?.instantiateViewController(withIdentifier: "\(RegisterController.self)") as! RegisterController
        controller.viewModel.registerCallBack = { user in
            self.emailTextField.text = user.email
            self.passwordTextField.text = user.password
        }
        navigationController?.show(controller, sender: nil)
    }
}
