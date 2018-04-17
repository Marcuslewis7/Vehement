//
//  PageViewController.swift
//  Vehement
//
//  Created by Marcus Lewis on 16/04/2018.
//  Copyright © 2018 Marcus Lewis. All rights reserved.
//

import UIKit

class PageViewController: UIPageViewController {

    var pageHeaders = ["W O R K O U T", "F I N D  A  G Y M", "G E T  S O C I A L", "P L A N   S C H E D U L E"]
    var pageImages = ["fullsizeoutput_1154_iphonexspacegrey_portrait", "", "fullsizeoutput_1151_iphonexspacegrey_portrait", "fullsizeoutput_115f_iphonexspacegrey_portrait"]
    var smallPageImages = ["", "fullsizeoutput_1157_iphonexspacegrey_portrait", "", ""]
    var mediumPageImages = ["", "fullsizeoutput_1156_iphonexspacegrey_portrait", "", ""]
    var pageDescs = ["Learn the best workouts designed and tailored to you!", "Find your local gym and navigate to it!", "Get involved with the vehement community by posting on the wall!", "Plan your workouts for the month!"]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.dataSource = self
        
        if let startWalkthroughVC = self.viewControllerAtIndex(index: 0) {
            setViewControllers([startWalkthroughVC], direction: .forward, animated: true, completion: nil)
        }
    }
    
    func nextPageWithIndex(index: Int) {
        if let nextWalkthroughVC = self.viewControllerAtIndex(index: index+1) {
            setViewControllers([nextWalkthroughVC], direction: .forward, animated: true, completion: nil)
        }
    }

    func viewControllerAtIndex(index: Int) -> WalkthroughVC? {
        if index == NSNotFound || index < 0 || index >= self.pageDescs.count {
            return nil
        }
        if let viewController = storyboard?.instantiateViewController(withIdentifier: "WalkthroughVC") as? WalkthroughVC {
            viewController.imageName = pageImages[index]
            viewController.smallImageName = smallPageImages[index]
            viewController.mediumImageName = mediumPageImages[index]
            viewController.headerText = pageHeaders[index]
            viewController.descText = pageDescs[index]
            viewController.index = index
            return viewController
        }
        return nil
    }
    
    
}

extension PageViewController: UIPageViewControllerDataSource {
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        var index = (viewController as! WalkthroughVC).index
        index -= 1
        return self.viewControllerAtIndex(index: index)
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        var index = (viewController as! WalkthroughVC).index
        index += 1
        return self.viewControllerAtIndex(index: index)
    }
    
    
}
