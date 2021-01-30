//
//  BorderNumberButton.swift
//  Calculator
//
//  Created by H0mmer on 25/01/2021.
//

import UIKit

@IBDesignable class BorderNumberButton: UIButton {

    override func prepareForInterfaceBuilder() {
        customizeView()
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        customizeView()
        
        
    }
    
    override var isHighlighted :Bool {
            get {
                return super.isHighlighted
            }
            set {
                if newValue {
                    self.backgroundColor = UIColor.lightGray
                }
                else {
                    self.backgroundColor = UIColor.darkText
                }
                
                super.isHighlighted = newValue
            }
        }
    
    func customizeView() {
        
        layer.borderWidth = 1.0
        layer.borderColor = UIColor.white.cgColor
        layer.cornerRadius = 10
        clipsToBounds = true
        backgroundColor = UIColor.darkText
    }

}
