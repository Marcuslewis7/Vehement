//
//  WalkthroughVC.swift
//  Vehement
//
//  Created by Marcus Lewis on 16/04/2018.
//  Copyright © 2018 Marcus Lewis. All rights reserved.
//

import UIKit

class WalkthroughVC: UIViewController {

    @IBOutlet weak var headerLabel: UILabel!
    @IBOutlet weak var descLabel: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var mediumImageView: UIImageView!
    @IBOutlet weak var smallImageView: UIImageView!
    @IBOutlet weak var pageControl: UIPageControl!
    @IBOutlet weak var nextButton: UIButton!
    @IBOutlet weak var startButton: UIButton!
    
    var index = 0
    var headerText = ""
    var imageName = ""
    var smallImageName = ""
    var mediumImageName = ""
    var descText = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()

        headerLabel.text = headerText
        descLabel.text = descText
        imageView.image = UIImage(named: imageName)
        smallImageView.image = UIImage(named: smallImageName)
        mediumImageView.image = UIImage(named: mediumImageName)
        pageControl.currentPage = index
    
        startButton.isHidden = (index == 3) ? false : true
        nextButton.isHidden = (index == 3) ? true : false
        startButton.layer.cornerRadius = 5.0
        startButton.layer.masksToBounds = true
    }
    
    @IBAction func startButtonClicked(sender: AnyObject) {
        let userDefaults = UserDefaults.standard
        userDefaults.set(true, forKey: "DisplayedWalkthrough")
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func nextButtonClicked(sender: AnyObject) {
        let pageViewController = self.parent as! PageViewController
        pageViewController.nextPageWithIndex(index: index)
    }


}
