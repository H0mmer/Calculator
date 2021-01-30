//
//  BorderColorButton.swift
//  Calculator
//
//  Created by H0mmer on 24/01/2021.
//

import UIKit

@IBDesignable class BorderOperationButton: UIButton {

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
                    self.backgroundColor = #colorLiteral(red: 0.5843137503, green: 0.8235294223, blue: 0.4196078479, alpha: 1)
                }
                else {
                    self.backgroundColor = #colorLiteral(red: 0.3411764801, green: 0.6235294342, blue: 0.1686274558, alpha: 1)
                }
                super.isHighlighted = newValue
            }
        }
    
    func customizeView() {
        
        super.awakeFromNib()
        
        layer.borderWidth = 2.0
        layer.borderColor = #colorLiteral(red: 0.9999960065, green: 1, blue: 1, alpha: 1)
        layer.cornerRadius = 5
        clipsToBounds = true
        backgroundColor = #colorLiteral(red: 0.3411764801, green: 0.6235294342, blue: 0.1686274558, alpha: 1)
    }
}
