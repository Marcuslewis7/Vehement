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
import YouTubePlayer
import WebKit
//@IBDesignable


class VideoViewVC: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    
    @IBOutlet weak var videoTableView: UITableView!
    @IBOutlet var videoPlayer: YouTubePlayerView!
    var myPassVideoCode = String()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print("this is my VideoViewVC video code: ",videocode)//myPassVideoCode)
        videoPlayer.loadVideoID(videocode)//myPassVideoCode)
        
        videoTableView.dataSource = self
        videoTableView.delegate = self
        videoTableView.reloadData()
   
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
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let myCellChoice = DataService.instance.allWorkouts[indexPath.row]
        videoPlayer.loadVideoID(myCellChoice.videoCode)
    }


}
