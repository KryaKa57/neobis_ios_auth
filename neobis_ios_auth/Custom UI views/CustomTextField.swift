//
//  CustomTextField.swift
//  neobis_ios_auth
//
//  Created by Alisher on 06.12.2023.
//

import Foundation
import UIKit
import SnapKit

class CustomTextField: UITextField {
    
    let padding = UIEdgeInsets(top: 0, left: 15, bottom: 0, right: 15)
    
    var textValue: String
    
    override var isSelected: Bool {
        didSet {
            if isSelected {
                self.layer.borderWidth = 2
                self.layer.borderColor = UIColor.black.cgColor
            } else {
                self.layer.borderWidth = 0
            }
        }
    }
    
    required init(textValue: String, isHidden: Bool = false) {
        CustomTextField.appearance().tintColor = .black
        self.textValue = textValue
        super.init(frame: .zero)
        setup(isHidden: isHidden)
        setSize()
    }
    
        
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
        
    private func setup(isHidden: Bool) {
        let textAttributes = [NSAttributedString.Key.foregroundColor: UIColor(rgb: 0x767676),
                              NSAttributedString.Key.font: UIFont(name: "gothampro", size: 16)!]
        self.backgroundColor = UIColor(rgb: 0xF8F8F8)
        self.attributedPlaceholder = NSAttributedString(string: textValue, attributes: textAttributes)
        self.layer.cornerRadius = 16
        self.defaultTextAttributes = textAttributes
        
        if isHidden {
            let view = UIView()
            let iconButton = UIButton()
            iconButton.setImage(UIImage(systemName: "eye.fill")?.withRenderingMode(.alwaysTemplate), for: .normal)
            iconButton.tintColor = UIColor(rgb: 0x767676)
            iconButton.frame = CGRectMake(0.0, 0.0, 30, 20)
            
            view.contentMode = UIView.ContentMode.center
            view.frame = CGRectMake(0.0, 0.0, 50, 20)
            view.addSubview(iconButton)
            
            self.clearButtonMode = .whileEditing
            self.rightViewMode = .unlessEditing
            self.rightView = view
            self.isSecureTextEntry = true
            self.autocorrectionType = .no
            
            iconButton.addTarget(self, action: #selector(clicked(_:)), for: .touchUpInside)
        }
    }
    
    private func setSize() {
        self.snp.makeConstraints { make in
            make.width.equalTo(330)
            make.height.equalTo(50)
        }
    }

    override func layoutSubviews() {
        super.layoutSubviews()

        for view in subviews {
            if let button = view as? UIButton {
                button.setImage(button.image(for: .normal)?.withRenderingMode(.alwaysTemplate), for: .normal)
                button.tintColor = UIColor(rgb: 0x767676)
            }
        }
    }
    
    @objc private func clicked(_ sender:UIButton!) {
        sender.setImage(UIImage(systemName: isSecureTextEntry ? "eye.slash.fill" : "eye.fill"), for: .normal)
        isSecureTextEntry = !isSecureTextEntry
    }
    
    override var isSecureTextEntry: Bool {
        didSet {
            if isFirstResponder {
                _ = becomeFirstResponder()
            }
        }
    }

    override func becomeFirstResponder() -> Bool {
        let success = super.becomeFirstResponder()
        if isSecureTextEntry, let text = self.text {
            self.text?.removeAll()
            insertText(text)
        }
        return success
    }
    
    
    override func clearButtonRect(forBounds bounds: CGRect) -> CGRect {
        let originalRect = super.clearButtonRect(forBounds: bounds)
        return originalRect.offsetBy(dx: -20, dy: 0)
    }
    
    override open func textRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: padding)
    }

    override open func placeholderRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: padding)
    }

    override open func editingRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: padding)
    }
}
