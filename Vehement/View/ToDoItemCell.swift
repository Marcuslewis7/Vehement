//
//  ToDoItemCell.swift
//  Vehement
//
//  Created by Marcus Lewis on 10/04/2018.
//  Copyright © 2018 Marcus Lewis. All rights reserved.
//

import UIKit

class ToDoItemCell: UITableViewCell {

    @IBOutlet weak var contentLabel: UILabel!
    @IBOutlet weak var dayLabel: UILabel!
    @IBOutlet weak var myMonthLabel: UILabel!
    
    
    func configureCell(content: String, dayContent: String, myMonthContent: String) {
        self.contentLabel.text = content
        self.dayLabel.text = dayContent
        self.myMonthLabel.text = myMonthContent
    }
}


