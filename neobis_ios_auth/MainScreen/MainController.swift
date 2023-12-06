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
    
    init(view: MainView) {
        self.mainView = view
        super.init(nibName: nil, bundle: nil)
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
        self.navigationController?.popToRootViewController(animated: true)
    }
}

