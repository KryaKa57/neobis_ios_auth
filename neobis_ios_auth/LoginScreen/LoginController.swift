//
//  ViewController.swift
//  neobis_ios_auth
//
//  Created by Alisher on 29.11.2023.
//

import UIKit

class LoginController: UIViewController {

    private var loginView: LoginView
    private var loginViewModel: LoginViewModel
    private let systemBounds = UIScreen.main.bounds

    override func loadView() {
        view = loginView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.addTargets()
        
        loginView.loginTextField.delegate = self
        loginView.passwordTextField.delegate = self
    }
    
    init(view: LoginView, viewModel: LoginViewModel = LoginViewModel()) {
        self.loginView = view
        self.loginViewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func addTargets() {
        loginView.enterButton.addTarget(self, action: #selector(goToMainScreen), for: .touchUpInside)
        loginView.registerButton.addTarget(self, action: #selector(goToRegisterScreen), for: .touchUpInside)
    }
    
    @objc func goToRegisterScreen() {
        let view = RegisterView()
        let viewModel = RegisterViewModel()
        let nextScreen = RegisterController(view: view, viewModel: viewModel)
        self.navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        self.navigationController?.navigationBar.tintColor = UIColor(rgb: 0x000000, alpha: 0)
        self.navigationController?.pushViewController(nextScreen, animated: true)
    }
    
    @objc func goToMainScreen() {
        let loginData = Login(username: loginView.loginTextField.text ?? ""
                            , email: ""
                            , password: loginView.passwordTextField.text ?? "")
        loginViewModel.postData(data: loginData)
        
        print(loginViewModel.isUserLogined)
        if loginViewModel.isUserLogined {
            let view = MainView()
            let nextScreen = MainController(view: view)
            self.navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
            self.navigationController?.navigationBar.tintColor = UIColor(rgb: 0x000000, alpha: 0)
            self.navigationController?.pushViewController(nextScreen, animated: true)
        }
    }
}

extension LoginController: UITextFieldDelegate {
    func textFieldDidBeginEditing(_ textField: UITextField) {
        textField.isSelected = true
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        textField.isSelected = false
    }
}
