//
//  EmailAlertViewController.swift
//  neobis_ios_auth
//
//  Created by Alisher on 11.12.2023.
//

import Foundation
import UIKit

class EmailAlertViewController: UIViewController {
    private let systemBounds = UIScreen.main.bounds
    var mainVC: SendMailController
    
    lazy var backgroundView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.layer.cornerRadius = 10
        return view
    }()
    
    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Мы выслали еще одно письмо на указанную тобой почту example@gmail.com"
        label.textAlignment = .center
        label.textColor = .black
        label.numberOfLines = 0
        return label
    }()
    
    lazy var messageLabel: UILabel = {
        let label = UILabel()
        label.text = "Не забудь проверить ящик “Спам”!11!!!!"
        label.numberOfLines = 0
        label.textAlignment = .center
        label.textColor = .black
        return label
    }()
    
    lazy var confirmButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Понятно!", for: .normal)
        button.backgroundColor = .black
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 8
        button.addTarget(self, action: #selector(closeAlert), for: .touchUpInside)
        return button
    }()
    
    
    init(mainVC: SendMailController) {
        self.mainVC = mainVC
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.createView()
    }
    
    private func createView() {
        let alertWidth: CGFloat = systemBounds.width - 64
        let alertHeight: CGFloat = 200
        
        let xPos = (view.frame.width - alertWidth) / 2
        let yPos = (view.frame.height - alertHeight) / 2
        view.backgroundColor = UIColor(rgb: 0x000000, alpha: 0.8)
        
        backgroundView.frame = CGRect(x: xPos, y: yPos, width: alertWidth, height: alertHeight)
        titleLabel.frame = CGRect(x: xPos + 20, y: yPos + 20, width: alertWidth - 40, height: 30)
        messageLabel.frame = CGRect(x: xPos + 20, y: yPos + 60, width: alertWidth - 40, height: 60)
        confirmButton.frame = CGRect(x: xPos + 20, y: yPos + 140, width: alertWidth - 40, height: 40)
        
        view.addSubview(backgroundView)
        view.addSubview(titleLabel)
        view.addSubview(messageLabel)
        view.addSubview(confirmButton)
    }
    
    @objc func closeAlert() {
        dismiss(animated: true) {
            self.mainVC.navigateToNextScreen()
        }
    }
}

