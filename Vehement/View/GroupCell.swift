//
//  GroupCell.swift
//  Vehement
//
//  Created by Marcus Lewis on 05/04/2018.
//  Copyright © 2018 Marcus Lewis. All rights reserved.
//

import UIKit

class GroupCell: UITableViewCell {

    @IBOutlet weak var groupTitleLabel: UILabel!
    @IBOutlet weak var groupDescLabel: UILabel!
    @IBOutlet weak var memberCountLabel: UILabel!
    
    func configureCell(title: String, description: String, memberCount: Int) {
        self.groupTitleLabel.text = title
        self.groupDescLabel.text = description
        self.memberCountLabel.text = "\(memberCount) Members"
    }
    
    
}
