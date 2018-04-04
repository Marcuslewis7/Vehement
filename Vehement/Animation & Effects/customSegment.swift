//
//  customSegment.swift
//  Vehement
//
//  Created by Marcus Lewis on 03/04/2018.
//  Copyright © 2018 Marcus Lewis. All rights reserved.
//

import UIKit

class customSegment: UISegmentedControl {
    
    override func awakeFromNib() {
        super.awakeFromNib()
        layer.borderWidth = 2.0
        layer.borderColor = #colorLiteral(red: 0.1450774968, green: 0.1451098621, blue: 0.1450754404, alpha: 1)
    }
    
}
