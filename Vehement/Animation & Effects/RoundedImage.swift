//
//  RoundedButton.swift
//  Vehement
//
//  Created by Marcus Lewis on 06/02/2018.
//  Copyright © 2018 Marcus Lewis. All rights reserved.
//

import UIKit
@IBDesignable

class RoundedImage: UIImageView {
    
    @IBInspectable var cornerRadius: CGFloat = 50.0 {
        didSet {
            self.layer.cornerRadius = cornerRadius
        }
    }
    
    override func awakeFromNib() {
        self.setupView()
    }
    
    func setupView() {
        self.layer.cornerRadius = cornerRadius
        self.clipsToBounds = true
    }
    
    override func prepareForInterfaceBuilder() {
        super.prepareForInterfaceBuilder()
        setupView()
    }
}
