//
//  RegisterController.swift
//  neobis_ios_auth
//
//  Created by Alisher on 06.12.2023.
//

import Foundation
import UIKit

class RegisterController: UIViewController {
    
    private var registerView: RegisterView
    private let systemBounds = UIScreen.main.bounds
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.createNavigation()
        self.createView()
        
        registerView.emailTextField.delegate = self
        registerView.createLoginTextField.delegate = self
        registerView.createPassTextField.delegate = self
        registerView.checkPasswordTextField.delegate = self
        
        registerView.createPassTextField.addTarget(self, action: #selector(textFieldDidChange(_:)), for: .editingChanged)
        registerView.allTextFields.forEach({
            $0.addTarget(self, action: #selector(isEverythingCorrect(_:)), for: .editingChanged)
        })
        registerView.nextButton.addTarget(self, action: #selector(goToNextScreen(_:)), for: .touchUpInside)
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow(notification:)), name: UIResponder.keyboardWillShowNotification, object: nil)

        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide(notification:)), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    
    init(view: RegisterView) {
        self.registerView = view
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc private func goToNextScreen(_ button: UIButton) {
        let view = SendMailView()
        let nextScreen = SendMailController(view: view, email: registerView.emailTextField.text ?? "")
        self.navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        self.navigationController?.navigationBar.tintColor = UIColor(rgb: 0x000000, alpha: 0)
        self.navigationController?.pushViewController(nextScreen, animated: true)
        
    }
    
    
    @objc private func textFieldDidChange(_ textField: UITextField) {
        guard let text = textField.text else { return }
        let indexOfIncorrectRequirements: [Int] = indicesOfValidRequirements(text)
        registerView.hintsStackElements.forEach({
            $0.style = .normal
        })
        indexOfIncorrectRequirements.forEach({
            registerView.hintsStackElements[$0].style = .correct
        })
    }
    
    @objc private func isEverythingCorrect(_ textField: UITextField) {
        guard
            let email = registerView.emailTextField.text, !email.isEmpty,
            let login = registerView.createLoginTextField.text, !login.isEmpty,
            let password = registerView.createPassTextField.text, !password.isEmpty,
            let repeatPassword = registerView.checkPasswordTextField.text, !repeatPassword.isEmpty,
            repeatPassword == password, isValidEmail(email),
            indicesOfValidRequirements(password).count == registerView.hintsStackElements.count
        else {
            registerView.nextButton.isEnabled = false
            return
        }
        registerView.nextButton.isEnabled = true
    }
    
    @objc private func keyboardWillShow(notification: NSNotification) {
        if let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameBeginUserInfoKey] as? NSValue)?.cgRectValue {
            self.registerView.displayKeyBoard(keyboardSize.height, isDisplay: true)
        }
    }

    @objc private func keyboardWillHide(notification: NSNotification) {
        self.registerView.displayKeyBoard(CGFloat(), isDisplay: false)
    }
    
    private func createNavigation() {
        self.navigationItem.title = "Регистрация"
        self.navigationController?.navigationBar.tintColor = .black
        self.navigationController?.viewSafeAreaInsetsDidChange()
        
        let textAttributes = [NSAttributedString.Key.foregroundColor:UIColor.black]
        navigationController?.navigationBar.titleTextAttributes = textAttributes
        
        registerView.frame = CGRect(x: 0, y: 0, width: systemBounds.width, height: systemBounds.height)
        registerView.center = view.center
        view.addSubview(registerView)
    }
    
    private func createView() {
        registerView.frame = CGRect(x: 0, y: 0, width: systemBounds.width, height: systemBounds.height)
        registerView.center = view.center
        view.addSubview(registerView)
    }
}

extension RegisterController: UITextFieldDelegate {
    func textFieldDidBeginEditing(_ textField: UITextField) {
        textField.isSelected = true
        textField.textColor = .black
        registerView.removeTextFieldError(textField: textField)
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        textField.isSelected = false
        var hasError = false

        if textField == registerView.createPassTextField {
            registerView.hintsStackElements.forEach({
                if $0.style == .normal {
                    $0.style = .error
                    hasError = true
                }
            })
        }
        else if textField == registerView.checkPasswordTextField {
            if textField.text != registerView.createPassTextField.text {
                registerView.displayTextFieldError(textField: textField)
                hasError = true
            }
        }
        else if textField == registerView.emailTextField {
            if !isValidEmail(textField.text ?? "") {
                registerView.displayTextFieldError(textField: textField)
                hasError = true
            }
        }
        
        if hasError {
            textField.textColor = UIColor(rgb: 0xEC0000)
        }
    }
    
    func isValidEmail(_ email: String) -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"

        let emailPred = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailPred.evaluate(with: email)
    }
    
    func indicesOfValidRequirements(_ password: String) -> [Int] {
        var indices: [Int] = []
        if (password.count >= 8 && password.count <= 15) { indices.append(0) }
        if (password.contains(/[a-z]/) && password.contains(/[A-Z]/)) { indices.append(1) }
        if (password.contains(/[0-9]/)) { indices.append(2) }
        if (password.contains(/[^a-zA-Z0-9]/)) { indices.append(3) }
        return indices
    }
}

