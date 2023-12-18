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
    
    
    override func loadView() {
        view = sendMailView
    }
    
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
        let customAlert = EmailAlertViewController(mainVC: self)
        customAlert.modalPresentationStyle = .overFullScreen
        present(customAlert, animated: true, completion: nil)
    }
    
    private func createView() {
        self.navigationItem.title = "Регистрация"
        self.navigationController?.navigationBar.tintColor = .black
        self.navigationController?.viewSafeAreaInsetsDidChange()
    }
    
    func navigateToNextScreen() {
        let view = MainView()
        let nextScreen = MainController(view: view, isNewUser: true)
        self.navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        self.navigationController?.navigationBar.tintColor = UIColor(rgb: 0x000000, alpha: 0)
        self.navigationController?.pushViewController(nextScreen, animated: true)
    }
}
