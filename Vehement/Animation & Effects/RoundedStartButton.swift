//
//  RoundedStartButton.swift
//  Vehement
//
//  Created by Marcus Lewis on 28/03/2018.
//  Copyright © 2018 Marcus Lewis. All rights reserved.
//

import UIKit

class RoundedStartButton: UIButton {
    
    override func awakeFromNib() {
        super.awakeFromNib()
        layer.borderWidth = 2.0
        layer.borderColor = UIColor.white.cgColor
        layer.cornerRadius = 26
    }
    
}
