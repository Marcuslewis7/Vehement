//
//  VideoViewVC.swift
//  Vehement
//
//  Created by Marcus Lewis on 26/03/2018.
//  Copyright © 2018 Marcus Lewis. All rights reserved.
//

import UIKit
import AVKit
import AVFoundation
@IBDesignable

class VideoViewVC: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var videoTableView: UITableView!
    @IBOutlet var myWebView: UIWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        videoTableView.dataSource = self
        videoTableView.delegate = self
        
        myWebView.loadHTMLString("<iframe width=\"\(myWebView.frame.size.width)\" height=\"\(myWebView.frame.size.height)\" src=\"https://www.youtube.com/embed/_kAlQ5Bh5aY\" frameborder=\"0\" allow=\"autoplay; encrypted-media\" allowfullscreen style=\"height: 100%; width: 100%;\"></iframe>", baseURL: nil)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return DataService.instance.getAllWorkouts().count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "WorkoutsTableCell") as? WorkoutsTableCell {
            let workout = DataService.instance.getAllWorkouts()[indexPath.row]
            cell.updateViews(workout: workout)
            return cell
        } else {
            return CategoryCell()
        }
    }


}
