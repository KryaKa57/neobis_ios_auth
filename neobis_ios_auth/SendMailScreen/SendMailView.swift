//
//  SendMailView.swift
//  neobis_ios_auth
//
//  Created by Alisher on 06.12.2023.
//

import Foundation
import UIKit
import SnapKit

class SendMailView: UIView {
    private let systemBounds = UIScreen.main.bounds
    
    lazy var sendEmailLabel: UILabel = {
        let label = UILabel()
        let textAttributes = [
            NSAttributedString.Key.font: UIFont(name: "gothampro-medium", size: 20)!,
            NSAttributedString.Key.foregroundColor: UIColor(rgb: 0x000000)
        ]
        label.attributedText = NSAttributedString( string: "Выслали письмо со ссылкой\nдля завершения регистрации\nна example@gmail.com",
                                                   attributes: textAttributes)
        label.numberOfLines = 3
        label.textAlignment = .center
        return label
    }()
    
    lazy var secondaryLabel: UILabel = {
        let label = UILabel()
        let textAttributes = [
            NSAttributedString.Key.font: UIFont(name: "gothampro", size: 16)!,
            NSAttributedString.Key.foregroundColor: UIColor(rgb: 0x767676)
        ]
        var mutableString = NSMutableAttributedString( string: "Если письмо не пришло, не спешите ждать совиную почту - лучше проверьте ящик \"Спам\"\n\n\n\n(´｡• ω •｡`)", attributes: textAttributes)
        mutableString.addAttribute(NSAttributedString.Key.foregroundColor, value: UIColor.black, range: NSRange(location:61,length: mutableString.string.count - 61))
        label.attributedText = mutableString
        label.numberOfLines = 0
        label.textAlignment = .center
        return label
    }()
    
    lazy var emailImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "email")
        return imageView
    }()
    
    lazy var nextButton = CustomButton(textValue: "Письмо не пришло", isPrimary: false)
    
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
        
        self.addSubview(sendEmailLabel)
        self.addSubview(secondaryLabel)
        self.addSubview(emailImageView)
        self.addSubview(nextButton)
    }
    
    private func setConstraints() {
        self.sendEmailLabel.snp.makeConstraints { make in
            make.top.lessThanOrEqualToSuperview().offset(systemBounds.height * 0.2)
            make.leading.trailing.equalToSuperview().inset(32)
            make.centerX.equalToSuperview()
        }
        self.secondaryLabel.snp.makeConstraints { make in
            make.top.equalTo(sendEmailLabel.snp.bottom).offset(32)
            make.leading.trailing.equalToSuperview().inset(32)
            make.centerX.equalToSuperview()
        }
        self.emailImageView.snp.makeConstraints { make in
            make.top.equalTo(secondaryLabel.snp.bottom).offset(32)
            make.leading.trailing.equalToSuperview().inset(64)
            make.centerX.equalToSuperview()
            make.height.equalTo(emailImageView.snp.width)
        }
        self.nextButton.snp.makeConstraints { make in
            make.top.equalTo(emailImageView.snp.bottom).offset(32)
            make.leading.trailing.equalToSuperview().inset(32)
            make.height.equalTo(systemBounds.height * 0.06)
            make.bottom.lessThanOrEqualToSuperview().inset(32)
        }
    }
}
