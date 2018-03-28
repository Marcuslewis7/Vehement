//
//  JoinNowVC.swift
//  Vehement
//
//  Created by Marcus Lewis on 08/02/2018.
//  Copyright © 2018 Marcus Lewis. All rights reserved.
//

import UIKit
import FBSDKLoginKit
import Firebase
import FirebaseDatabase
import GoogleSignIn
import UserNotifications

@IBDesignable
class JoinNowVC: UIViewController ,GIDSignInUIDelegate, FBSDKLoginButtonDelegate {

    //Outlets
    @IBOutlet weak var buttonsView: UIView!
    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var createButton: BoarderButton!
    
    //loads view
    override func viewDidLoad() {
        super.viewDidLoad()
        setupFacebookButtons()
        setupGoogleButtons()
        createButton.addTarget(self, action: #selector(handleSignUp), for: .touchUpInside)
        if Auth.auth().currentUser != nil {
            //log out the user
        }
        
    }

    fileprivate func setupGoogleButtons() {
        //add google sign in button
        let googleButton = GIDSignInButton()
        googleButton.frame = CGRect(x: 0, y: 59, width: buttonsView.frame.width, height: 40)
        buttonsView.addSubview(googleButton)
        GIDSignIn.sharedInstance().uiDelegate = self
    }
    
    @objc func handleCustomGoogleSign() {
        GIDSignIn.sharedInstance().signIn()
    }
    
    fileprivate func setupFacebookButtons() {
        let loginButton = FBSDKLoginButton()
        buttonsView.addSubview(loginButton)
        loginButton.frame = CGRect(x: 0, y: 0, width: buttonsView.frame.width, height: 40)
        loginButton.delegate = self
        loginButton.readPermissions = ["email", "public_profile"]
    }
    
    func loginButtonDidLogOut(_ loginButton: FBSDKLoginButton!) {
        print("Did log out of facebook")
    }
    
    func loginButton(_ loginButton: FBSDKLoginButton!, didCompleteWith result: FBSDKLoginManagerLoginResult!, error: Error!) {
        if error != nil {
            print(error)
            return
        } else {
        showEmailAddress()
        }
    }
    
    func showEmailAddress() {
        let accessToken = FBSDKAccessToken.current()
        guard let accessTokenString = accessToken?.tokenString else { return }
        let credentials = FacebookAuthProvider.credential(withAccessToken: accessTokenString)
        
        //.signIn
        //.currentUser?.link
        Auth.auth().signIn(with: credentials, completion: { (user, error) in
            if error != nil {
                let duplicateUserError:UIAlertView = UIAlertView(title: "Please try again", message: "\(error!.localizedDescription)", delegate: self, cancelButtonTitle: "Cancel")
                duplicateUserError.show()
                try! Auth.auth().signOut()
                print("Something went wrong with our FB user: ", error ?? "")
                return
            }
            print("Successfully logged in with our user: ", user ?? "")
            self.performSegue(withIdentifier: "createAccountSegue", sender: self)
        })
        FBSDKGraphRequest(graphPath: "/me", parameters: ["fields": "id, name, email"]).start { (connection, result, err) in
            if err != nil {
                print("Failed to start graph request:", err ?? "")
                return
            }
            print(result ?? "")
        }
    }
    
    var ref : DatabaseReference!
    @IBAction func createButtonPressed(_ sender: Any) {
        ref = Database.database().reference()
        
        if usernameTextField.text != "" {
            ref.child("UsernameList").childByAutoId().setValue(usernameTextField.text)
        }
        
    }
    
    
    func setCreateAccountButton(enabled:Bool) {
        if enabled {
            createButton.alpha = 1.0
            createButton.isEnabled = true
        } else {
            createButton.alpha = 0.5
            createButton.isEnabled = false
        }
    }
    
    //Join with email address
    @objc func handleSignUp() {
        guard let username = usernameTextField.text else { return }
        guard let email = emailTextField.text else { return }
        guard let password = passwordTextField.text else { return }
        
        Auth.auth().createUser(withEmail: email, password: password) { user, error in
            if error == nil && user != nil {
                print("User created!")
                
                let changeRequest = Auth.auth().currentUser?.createProfileChangeRequest()
                changeRequest?.displayName = username
                
                changeRequest?.commitChanges { error in
                    if error == nil {
                        print("User display name changed!")
                        self.performSegue(withIdentifier: "createAccountSegue", sender: self)
                    } else {
                        print("Error: \(error!.localizedDescription)")
                        
                    }
                }
                
            } else if (email.isEmpty && password.isEmpty && username.isEmpty) || (email.isEmpty && password.isEmpty) || (password.isEmpty && username.isEmpty) || (email.isEmpty && username.isEmpty) {
                let emptyFieldsError:UIAlertView = UIAlertView(title: "Please try again", message: "Please fill in all the fields so we can get you signed up to your account.", delegate: self, cancelButtonTitle: "Try again")
                emptyFieldsError.show()
            } else {
                let wrongFieldsError:UIAlertView = UIAlertView(title: "Please try again", message: "\(error!.localizedDescription)", delegate: self, cancelButtonTitle: "Try again")
                wrongFieldsError.show()
            }
        }
    }
    
    
    
    
    //action segues
    @IBAction func onExistingAccountPressed(_ sender: Any) {
        self.performSegue(withIdentifier: "existingAccountSegue", sender: self)
    }
    
    
    

}
