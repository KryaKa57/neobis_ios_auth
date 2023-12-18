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
    
    override func loadView() {
        view = mainView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
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
    
    private func addTargets() {
        mainView.exitButton.addTarget(self, action: #selector(showAlertMessage), for: .touchUpInside)
    }
    
    @objc func showAlertMessage() {
        let customAlert = ExitAlertViewController(vc: self)
        customAlert.modalPresentationStyle = .overFullScreen
        present(customAlert, animated: true, completion: nil)
    }
    
    func navigateToRootScreen() {
        self.navigationController?.popToRootViewController(animated: true)
    }
}
