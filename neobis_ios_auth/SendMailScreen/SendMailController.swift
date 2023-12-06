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
    }
    
    init(view: SendMailView, email: String) {
        self.sendMailView = view
        super.init(nibName: nil, bundle: nil)
        
        sendMailView.sendEmailLabel.text = "Выслали письмо со ссылкой\nдля завершения регистрации\nна \(email)"
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc private func goToNextScreen(_ button: UIButton) {
        print(5)
    }
    
    private func createView() {
        self.navigationItem.title = "Регистрация"
        self.navigationController?.navigationBar.tintColor = .black
        self.navigationController?.viewSafeAreaInsetsDidChange()
        
        sendMailView.frame = CGRect(x: 0, y: 0, width: systemBounds.width, height: systemBounds.height)
        sendMailView.center = view.center
        view.addSubview(sendMailView)
    }
}
