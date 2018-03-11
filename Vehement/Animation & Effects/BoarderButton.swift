//
//  BoarderButton.swift
//  Vehement
//
//  Created by Marcus Lewis on 07/02/2018.
//  Copyright © 2018 Marcus Lewis. All rights reserved.
//

import UIKit

class BoarderButton: UIButton {

    override func awakeFromNib() {
        super.awakeFromNib()
        layer.borderWidth = 3.0
        layer.borderColor = UIColor.white.cgColor
        layer.cornerRadius = 40
    }
    
}
