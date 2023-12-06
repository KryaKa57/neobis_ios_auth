//
//  ViewController.swift
//  neobis_ios_auth
//
//  Created by Alisher on 29.11.2023.
//

import UIKit

class LoginController: UIViewController {

    private var loginView: LoginView
    private let systemBounds = UIScreen.main.bounds
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.createView()
        self.addTargets()
        
        loginView.loginTextField.delegate = self
        loginView.passwordTextField.delegate = self
    }
    
    init(view: LoginView) {
        self.loginView = view
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func createView() {
        loginView.frame = CGRect(x: 0, y: 0, width: systemBounds.width, height: systemBounds.height)
        loginView.center = view.center
        view.addSubview(loginView)
    }
    
    private func addTargets() {
        loginView.enterButton.addTarget(self, action: #selector(goToMainScreen), for: .touchUpInside)
        loginView.registerButton.addTarget(self, action: #selector(goToRegisterScreen), for: .touchUpInside)
    }
    
    @objc func goToRegisterScreen() {
        let view = RegisterView()
        let nextScreen = RegisterController(view: view)
        self.navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        self.navigationController?.navigationBar.tintColor = UIColor(rgb: 0x000000, alpha: 0)
        self.navigationController?.pushViewController(nextScreen, animated: true)
    }
    
    @objc func goToMainScreen() {
        let view = MainView()
        let nextScreen = MainController(view: view)
        self.navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        self.navigationController?.navigationBar.tintColor = UIColor(rgb: 0x000000, alpha: 0)
        self.navigationController?.pushViewController(nextScreen, animated: true)
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