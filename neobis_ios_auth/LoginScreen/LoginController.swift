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
        self.assignRequestClosures()
        
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
    
    private func assignRequestClosures() {
        self.loginViewModel.onUserLogined = { [weak self] in
            DispatchQueue.main.async {
                self?.goToMainScreen()
            }
        }
        self.loginViewModel.onErrorMessage = { [weak self] error in
            DispatchQueue.main.async {
                self?.showLoginFailurePopUp()
            }
        }
    }
    private func addTargets() {
        loginView.enterButton.addTarget(self, action: #selector(loginUser), for: .touchUpInside)
        loginView.registerButton.addTarget(self, action: #selector(goToRegisterScreen), for: .touchUpInside)
    }
    
    @objc func loginUser() {
        let loginData = Login(username: loginView.loginTextField.text ?? ""
                            , email: ""
                            , password: loginView.passwordTextField.text ?? "")
        
        loginViewModel.postData(loginData)
    }
    
    @objc func goToRegisterScreen() {
        let nextScreen = RegisterController(view: RegisterView(), viewModel: RegisterViewModel())
        self.navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        self.navigationController?.navigationBar.tintColor = UIColor(rgb: 0x000000, alpha: 0)
        self.navigationController?.pushViewController(nextScreen, animated: true)
    }
    
    private func goToMainScreen() {
        let nextScreen = MainController(view: MainView(), isNewUser: false)
        self.navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        self.navigationController?.navigationBar.tintColor = UIColor(rgb: 0x000000, alpha: 0)
        self.navigationController?.pushViewController(nextScreen, animated: true)
    }
    
    func showLoginFailurePopUp() {
        let safeAreaTopInset = view.safeAreaInsets.top
        let popUpView = UIView(frame: CGRect(x: 32, y: safeAreaTopInset - 64 , width: view.frame.width - 64, height: 64))
        
        popUpView.layer.borderWidth = 1.0
        popUpView.layer.borderColor = UIColor.red.cgColor
        popUpView.layer.cornerRadius = 16
        popUpView.backgroundColor = .white
        
        let messageLabel = UILabel(frame: CGRect(x: 16, y: 0, width: popUpView.frame.width, height: popUpView.frame.height))
        messageLabel.text = "Неверный логин или пароль"
        messageLabel.textColor = .red // Red text color
        
        popUpView.addSubview(messageLabel)
        view.addSubview(popUpView)
        
        UIView.animate(withDuration: 0.5, delay: 0, options: .curveEaseInOut, animations: {
            popUpView.frame.origin.y = safeAreaTopInset
        }, completion: { _ in
            DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                UIView.animate(withDuration: 0.5, animations: {
                    popUpView.frame.origin.y = safeAreaTopInset - 64
                }, completion: { _ in
                    popUpView.removeFromSuperview()
                })
            }
        })
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
