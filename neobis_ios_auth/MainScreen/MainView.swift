//
//  MainView.swift
//  neobis_ios_auth
//
//  Created by Alisher on 06.12.2023.
//

import Foundation
import UIKit
import SnapKit

class MainView: UIView {
    private let systemBounds = UIScreen.main.bounds
    
    lazy var welcomeLabel: UILabel = {
        let label = UILabel()
        let textAttributes = [
                NSAttributedString.Key.font: UIFont(name: "gothampro-medium", size: 24)!,
                NSAttributedString.Key.foregroundColor: UIColor(rgb: 0x000000)
                ]
        label.attributedText = NSAttributedString(string: "С возвращением!",
                                                  attributes: textAttributes)
        return label
    }()
    
    lazy var secondaryLabel: UILabel = {
        let label = UILabel()
        let textAttributes = [
                NSAttributedString.Key.font: UIFont(name: "gothampro", size: 20)!,
                NSAttributedString.Key.foregroundColor: UIColor(rgb: 0x000000)
                ]
        label.attributedText = NSAttributedString(string: "Lorby - твой личный репетитор",
                                                  attributes: textAttributes)
        return label
    }()
    
    lazy var welcomeImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "illustration")
        return imageView
    }()
    
    lazy var exitButton = CustomButton(textValue: "Выйти", isPrimary: false)
    
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
        addSubview(welcomeLabel)
        addSubview(secondaryLabel)
        addSubview(welcomeImageView)
        addSubview(exitButton)
    }
    
    private func setConstraints() {
        self.welcomeLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(systemBounds.height * 0.2)
        }
        self.secondaryLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(welcomeLabel.snp.bottom).offset(16)
        }
        self.welcomeImageView.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.trailing.leading.equalToSuperview().inset(32)
            make.top.equalTo(secondaryLabel.snp.bottom).offset(32)
            make.height.equalTo(welcomeImageView.snp.width)
        }
        self.exitButton.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.bottom.equalToSuperview().inset(64)
        }
    }
}
