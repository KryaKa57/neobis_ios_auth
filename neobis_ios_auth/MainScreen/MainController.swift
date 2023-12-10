//
//  MainController.swift
//  neobis_ios_auth
//
//  Created by Alisher on 06.12.2023.
//

import Foundation
import UIKit

class MainController: UIViewController {

    private var mainView: MainView
    private let systemBounds = UIScreen.main.bounds
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.createView()
        self.addTargets()
    }
    
    init(view: MainView, isNewUser: Bool) {
        self.mainView = view
        super.init(nibName: nil, bundle: nil)
        
        if isNewUser {
            mainView.welcomeLabel.text = "Добро пожаловать!"
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func createView() {
        mainView.frame = CGRect(x: 0, y: 0, width: systemBounds.width, height: systemBounds.height)
        mainView.center = view.center
        view.addSubview(mainView)
    }
    
    private func addTargets() {
        mainView.exitButton.addTarget(self, action: #selector(goToRootScreen), for: .touchUpInside)
    }
    
    @objc func goToRootScreen() {
        let customAlert = ExitAlertViewController(vc: self)
        customAlert.modalPresentationStyle = .overFullScreen
        present(customAlert, animated: true, completion: nil)
    }
    
    func navigateToRootScreen() {
        self.navigationController?.popToRootViewController(animated: true)
    }
}


class ExitAlertViewController: UIViewController {
    private var mainVC: MainController
    private let systemBounds = UIScreen.main.bounds
    
    
    init(vc: MainController) {
        self.mainVC = vc
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let alertWidth: CGFloat = systemBounds.width - 64
        let alertHeight: CGFloat = 250
        
        let xPos = (view.frame.width - alertWidth) / 2
        let yPos = (view.frame.height - alertHeight) / 2
        
        // Customize the view to mimic an alert appearance
        let backgroundView = UIView(frame: CGRect(x: xPos, y: yPos, width: alertWidth, height: alertHeight))
        backgroundView.backgroundColor = .white
        backgroundView.layer.cornerRadius = 10
        view.addSubview(backgroundView)
        
        view.backgroundColor = UIColor(rgb: 0x000000, alpha: 0.8)
        
        let titleLabel = UILabel(frame: CGRect(x: xPos + 20, y: yPos + 20, width: alertWidth - 40, height: 30))
        titleLabel.text = "Выйти"
        titleLabel.textAlignment = .center
        titleLabel.textColor = .black
        titleLabel.numberOfLines = 0
        view.addSubview(titleLabel)
        
        let messageLabel = UILabel(frame: CGRect(x: xPos + 20, y: yPos + 60, width: alertWidth - 40, height: 60))
        messageLabel.text = "Точно выйти?"
        messageLabel.numberOfLines = 0
        messageLabel.textAlignment = .center
        messageLabel.textColor = .black
        messageLabel.numberOfLines = 0
        view.addSubview(messageLabel)
        
        let confirmButton = UIButton(type: .system)
        confirmButton.frame = CGRect(x: xPos + 20, y: yPos + 140, width: alertWidth - 40, height: 40)
        confirmButton.setTitle("Да, точно!", for: .normal)
        confirmButton.addTarget(self, action: #selector(closeAllAlert), for: .touchUpInside)
        confirmButton.backgroundColor = .black
        confirmButton.setTitleColor(.white, for: .normal)
        confirmButton.layer.cornerRadius = 8
        view.addSubview(confirmButton)
        
        let rejectButton = UIButton(type: .system)
        rejectButton.frame = CGRect(x: xPos + 20, y: yPos + 200, width: alertWidth - 40, height: 40)
        rejectButton.setTitle("Нет, остаться", for: .normal)
        rejectButton.addTarget(self, action: #selector(closeAlert), for: .touchUpInside)
        rejectButton.backgroundColor = .white
        rejectButton.setTitleColor(.black, for: .normal)
        rejectButton.layer.cornerRadius = 8
        view.addSubview(rejectButton)
    }
    
    @objc func closeAllAlert() {
        dismiss(animated: true) {
            self.mainVC.navigateToRootScreen()
        }
    }
    
    @objc func closeAlert() {
        dismiss(animated: true)
    }
}
