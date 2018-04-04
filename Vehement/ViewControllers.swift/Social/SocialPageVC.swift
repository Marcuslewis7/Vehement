//
//  SocialPageVC.swift
//  Vehement
//
//  Created by Marcus Lewis on 03/04/2018.
//  Copyright © 2018 Marcus Lewis. All rights reserved.
//

import UIKit

class SocialPageVC: UIViewController {
    
    @IBOutlet weak var viewContainer: UIView!
    
    var views: [UIView]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        views = [UIView]()
        views.append(feedVC().view)
        views.append(groupsVC().view)
        
        for v in views {
            viewContainer.addSubview(v)
        }
        viewContainer.bringSubview(toFront: views[0])
    }
    
    @IBAction func switchViewAction(_ sender: UISegmentedControl) {
        self.viewContainer.bringSubview(toFront: views[sender.selectedSegmentIndex])
    }
    
}
