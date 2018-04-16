//
//  feedVC.swift
//  Vehement
//
//  Created by Marcus Lewis on 03/04/2018.
//  Copyright © 2018 Marcus Lewis. All rights reserved.
//

import UIKit
import Firebase

class feedVC: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    //let tableView: UITableView = UITableView()
    
    var messageArray = [Message2]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        SocialDataService.instance.getAllFeedMessages { (returnedMessagesArray) in
            self.messageArray = returnedMessagesArray.reversed()
            self.tableView.reloadData()
        }
    }
    
}

extension feedVC: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print(messageArray.count)
        return messageArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "FeedCell") as? FeedCell else { return UITableViewCell() }
        print(messageArray[indexPath.row])
        let image = UIImage(named: "RestLater")
        let message = messageArray[indexPath.row]
        cell.configureCell(profileImage: image!, email: message.senderId, content: message.content)
        
        /*SocialDataService.instance.getUsername(forUID: message.senderId) { (returnedUsername) in
            cell.configureCell(profileImage: image!, email: returnedUsername, content: message.content)
        }
        */
        return cell
    }
}

