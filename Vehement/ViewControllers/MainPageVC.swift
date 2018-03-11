//
//  MainPageVC.swift
//  Vehement
//
//  Created by Marcus Lewis on 15/02/2018.
//  Copyright © 2018 Marcus Lewis. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth
import FBSDKLoginKit
import GoogleSignIn

class MainPageVC: UIViewController {

    @IBOutlet weak var logOutButton: UIButton!
    
    @IBAction func logOutButtonPressed(_ sender: Any) {
        //sign out of email
        try! Auth.auth().signOut()
        //sign out of facebook
        FBSDKLoginManager().logOut()
        //sign out of google
        GIDSignIn.sharedInstance().signOut()
        performSegue(withIdentifier: "logOutSegue", sender: self)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }

}
