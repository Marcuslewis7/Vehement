//
//  FeedCell.swift
//  Vehement
//
//  Created by Marcus Lewis on 04/04/2018.
//  Copyright © 2018 Marcus Lewis. All rights reserved.
//

import UIKit

class FeedCell: UITableViewCell {

    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var contentLabel: UILabel!

    func configureCell(profileImage: UIImage, email: String, content: String){
        self.profileImage.image = profileImage
        self.emailLabel.text = email
        self.contentLabel.text = content
    }
    
}
