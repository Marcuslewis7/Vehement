//
//  ProfileVC.swift
//  Vehement
//
//  Created by Marcus Lewis on 24/03/2018.
//  Copyright © 2018 Marcus Lewis. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth
import FBSDKLoginKit
import GoogleSignIn


class ProfileVC: UIViewController {

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
