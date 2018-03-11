//
//  LoginVC.swift
//  Vehement
//
//  Created by Marcus Lewis on 07/02/2018.
//  Copyright © 2018 Marcus Lewis. All rights reserved.
//

import UIKit

class LoginVC: UIViewController {
    
    //Outlets
    @IBOutlet weak var backgroundImage: UIImageView!
    @IBOutlet weak var mainView: UIView!
    @IBOutlet weak var mainViewConstraint: NSLayoutConstraint!
    @IBOutlet weak var joinButton: BoarderButton!
    @IBOutlet weak var loginButton: BoarderButton!
    
    //load view
    override func viewDidLoad() {
        super.viewDidLoad()
        mainViewConstraint.constant = 1000
        for i in [backgroundImage, mainView, joinButton, loginButton] {
            i?.alpha = 0
        }
        UIView.animate(withDuration: 1.0, animations: {
            self.backgroundImage.alpha = 1
        }) { (true) in
            self.animateView()
        }
    }
    
    //view slides down
    func animateView() {
        UIView.animate(withDuration: 1.0, animations: {
            self.mainView.alpha = 1
            self.mainViewConstraint.constant = 1
            self.view.layoutIfNeeded()
        }) { (true) in
            self.animateJoinButton()
        }
    }
    
    //join button slides down
    func animateJoinButton() {
        UIView.animate(withDuration: 1.0, animations: {
            self.joinButton.alpha = 1
        }) { (true) in
            self.animateLoginButton()
        }
    }
    
    //log in button slides down
    func animateLoginButton() {
        UIView.animate(withDuration: 1.0) {
            self.loginButton.alpha = 1
        }
    }
    
    
    //Segue Actions
    @IBAction func onJoinTapped(_ sender: Any) {
        self.performSegue(withIdentifier: "joinSegue", sender: self)
    }
    
    @IBAction func onSignInTapped(_ sender: Any) {
        self.performSegue(withIdentifier: "signInSegue", sender: self)
    }
    
    
    
    
    

}
