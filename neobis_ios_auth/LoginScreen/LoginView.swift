//
//  LoginView.swift
//  neobis_ios_auth
//
//  Created by Alisher on 06.12.2023.
//

import Foundation
import UIKit
import SnapKit

class LoginView: UIView {
    private let systemBounds = UIScreen.main.bounds
    
    lazy var globeImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "globe")
        return imageView
    }()
    
    lazy var welcomeLabel: UILabel = {
        let label = UILabel()
        let textAttributes = [
                NSAttributedString.Key.font: UIFont(name: "gothampro-medium", size: 24)!,
                NSAttributedString.Key.foregroundColor: UIColor(rgb: 0x000000)
                ]
        label.attributedText = NSAttributedString( string: "Welcome back!",
                                                   attributes: textAttributes)
        label.numberOfLines = 3
        return label
    }()
    
    lazy var loginTextField = CustomTextField(textValue: "Введите логин")
    lazy var passwordTextField = CustomTextField(textValue: "... и пароль", isHidden: true)
    lazy var enterButton = CustomButton(textValue: "Войти")
    lazy var registerButton = CustomButton(textValue: "У меня еще нет аккаунта", isPrimary: false)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        initialize()
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func initialize() {
        backgroundColor = .white
        addSubview(globeImageView)
        addSubview(welcomeLabel)
        addSubview(loginTextField)
        addSubview(passwordTextField)
        addSubview(enterButton)
        addSubview(registerButton)
    }
    
    private func setConstraints() {
        self.globeImageView.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(systemBounds.height * 0.1)
            make.centerX.equalToSuperview()
            make.width.equalToSuperview().multipliedBy(0.6)
            make.height.equalTo(globeImageView.snp.width)
        }
        self.welcomeLabel.snp.makeConstraints { make in
            make.top.equalTo(globeImageView.snp.bottom).offset(32)
            make.centerX.equalToSuperview()
            make.bottom.lessThanOrEqualTo(enterButton).offset(32)
        }
        self.loginTextField.snp.makeConstraints { make in
            make.top.equalTo(welcomeLabel.snp.bottom).offset(32)
            make.centerX.equalToSuperview()
        }
        self.passwordTextField.snp.makeConstraints { make in
            make.top.equalTo(loginTextField.snp.bottom).offset(8)
            make.centerX.equalToSuperview()
        }
        self.enterButton.snp.makeConstraints { make in
            make.top.equalTo(passwordTextField.snp.bottom).offset(16)
            make.centerX.equalToSuperview()
        }
        self.registerButton.snp.makeConstraints { make in
            make.top.equalTo(enterButton.snp.bottom).offset(8)
            make.bottom.lessThanOrEqualToSuperview().inset(64)
            make.centerX.equalToSuperview()
        }
    }
}
