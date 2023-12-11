//
//  CustomButton.swift
//  neobis_ios_auth
//
//  Created by Alisher on 06.12.2023.
//

import Foundation
import UIKit

enum ButtonStyle {
    case primary, secondary
    
    func getTitleColor() -> UIColor {(self == .primary) ? UIColor.white : UIColor.black}
    func getBackgroundColor() -> UIColor {self == .primary ? UIColor.black : UIColor.white}
    
    func getTitleColorDisabled() -> UIColor {(self == .primary) ? UIColor(rgb: 0x767676) : UIColor(rgb: 0x595959)}
    func getBackgroundColorDisabled() -> UIColor {(self == .primary) ? UIColor(rgb: 0xD7D7D7) : UIColor(rgb: 0xF6F6F6)}
}

class CustomButton: UIButton {
    
    let padding = UIEdgeInsets(top: 0, left: 25, bottom: 0, right: 5)
    
    var textValue: String
    var style = ButtonStyle.primary
    
    override var isEnabled: Bool {
        didSet {
            if isEnabled {
                self.backgroundColor = style.getBackgroundColor()
            } else {
                self.backgroundColor = style.getBackgroundColorDisabled()
            }
        }
    }
    
    required init(textValue: String, isPrimary: Bool = true) {
        self.textValue = textValue
        super.init(frame: .zero)
        style = isPrimary ? .primary : .secondary
        setup()
        setSize()
    }
        
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
        
    private func setup() {
        self.setTitle(textValue, for: .normal)
        self.titleLabel?.font = UIFont(name: "gothampro-medium", size: 16)!
        self.setTitleColor(style.getTitleColor(), for: .normal)
        self.setTitleColor(style.getTitleColorDisabled(), for: .disabled)
        self.backgroundColor = style.getBackgroundColor()
        self.layer.cornerRadius = 16
    }
    
    func setSize(_ height: Int = 50, _ width: Int = 330) {
        self.snp.makeConstraints { make in
            make.width.equalTo(width)
            make.height.equalTo(height)
        }
    }
}
