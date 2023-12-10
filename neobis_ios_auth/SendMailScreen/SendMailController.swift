//
//  SendMailController.swift
//  neobis_ios_auth
//
//  Created by Alisher on 06.12.2023.
//

import Foundation
import UIKit

class SendMailController: UIViewController {
    
    private var sendMailView: SendMailView
    private let systemBounds = UIScreen.main.bounds
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.createView()
        sendMailView.nextButton.addTarget(self, action: #selector(showCustomPopUp(_:)), for: .touchUpInside)
    }
    
    init(view: SendMailView, email: String) {
        self.sendMailView = view
        super.init(nibName: nil, bundle: nil)
        
        sendMailView.sendEmailLabel.text = "Выслали письмо со ссылкой\nдля завершения регистрации\nна \(email)"
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc private func showCustomPopUp(_  button: UIButton) {
        let customAlert = CustomAlertViewController(mainVC: self)
        customAlert.modalPresentationStyle = .overFullScreen
        present(customAlert, animated: true, completion: nil)
    }
    
    private func createView() {
        self.navigationItem.title = "Регистрация"
        self.navigationController?.navigationBar.tintColor = .black
        self.navigationController?.viewSafeAreaInsetsDidChange()
        
        sendMailView.frame = CGRect(x: 0, y: 0, width: systemBounds.width, height: systemBounds.height)
        sendMailView.center = view.center
        view.addSubview(sendMailView)
    }
    
    func navigateToNextScreen() {
        let view = MainView()
        let nextScreen = MainController(view: view, isNewUser: true)
        self.navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        self.navigationController?.navigationBar.tintColor = UIColor(rgb: 0x000000, alpha: 0)
        self.navigationController?.pushViewController(nextScreen, animated: true)
    }
    
}

class CustomAlertViewController: UIViewController {
    private let systemBounds = UIScreen.main.bounds
    var mainVC: SendMailController
    
    init(mainVC: SendMailController) {
        self.mainVC = mainVC
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let alertWidth: CGFloat = systemBounds.width - 64
        let alertHeight: CGFloat = 200
        
        let xPos = (view.frame.width - alertWidth) / 2
        let yPos = (view.frame.height - alertHeight) / 2
        
        // Customize the view to mimic an alert appearance
        let backgroundView = UIView(frame: CGRect(x: xPos, y: yPos, width: alertWidth, height: alertHeight))
        backgroundView.backgroundColor = .white
        backgroundView.layer.cornerRadius = 10
        view.addSubview(backgroundView)
        
        view.backgroundColor = UIColor(rgb: 0x000000, alpha: 0.8)
        
        let titleLabel = UILabel(frame: CGRect(x: xPos + 20, y: yPos + 20, width: alertWidth - 40, height: 30))
        titleLabel.text = "Мы выслали еще одно письмо на указанную тобой почту example@gmail.com"
        titleLabel.textAlignment = .center
        titleLabel.textColor = .black
        titleLabel.numberOfLines = 0
        view.addSubview(titleLabel)
        
        let messageLabel = UILabel(frame: CGRect(x: xPos + 20, y: yPos + 60, width: alertWidth - 40, height: 60))
        messageLabel.text = "Не забудь проверить ящик “Спам”!11!!!!"
        messageLabel.numberOfLines = 0
        messageLabel.textAlignment = .center
        messageLabel.textColor = .black
        messageLabel.numberOfLines = 0
        view.addSubview(messageLabel)
        
        let closeButton = UIButton(type: .system)
        closeButton.frame = CGRect(x: xPos + 20, y: yPos + 140, width: alertWidth - 40, height: 40)
        closeButton.setTitle("Понятно!", for: .normal)
        closeButton.addTarget(self, action: #selector(closeAlert), for: .touchUpInside)
        closeButton.backgroundColor = .black
        closeButton.setTitleColor(.white, for: .normal)
        closeButton.layer.cornerRadius = 8
        view.addSubview(closeButton)
    }
    
    @objc func closeAlert() {
        dismiss(animated: true) {
            // Navigate to the next screen here after the alert is dismissed
            self.mainVC.navigateToNextScreen()
        }
    }
}

