//
//  SignInVC.swift
//  Vehement
//
//  Created by Marcus Lewis on 08/02/2018.
//  Copyright © 2018 Marcus Lewis. All rights reserved.
//

import UIKit
import FBSDKLoginKit
import Firebase
import GoogleSignIn
import UserNotifications

@IBDesignable
class SignInVC: UIViewController ,GIDSignInUIDelegate, FBSDKLoginButtonDelegate {

    
    //Outlets
    @IBOutlet weak var logInButton: BoarderButton!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupFacebookButtons()
        setupGoogleButtons()
        logInButton.addTarget(self, action: #selector(handleSignIn), for: .touchUpInside)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        if Auth.auth().currentUser != nil {
            self.performSegue(withIdentifier: "logInSegue", sender: self)
        }
    }
    
    //add google sign in button
    fileprivate func setupGoogleButtons() {
        let googleButton = GIDSignInButton()
        googleButton.frame = CGRect(x: 38, y: 559, width: view.frame.width - 70, height: 40)
        view.addSubview(googleButton)
        GIDSignIn.sharedInstance().uiDelegate = self
    }
    
    @objc func handleCustomGoogleSign() {
        GIDSignIn.sharedInstance().signIn()
    }
    
    fileprivate func setupFacebookButtons() {
        let loginButton = FBSDKLoginButton()
        view.addSubview(loginButton)
        loginButton.frame = CGRect(x: 38, y: 510, width: view.frame.width - 74, height: 40)
        loginButton.delegate = self
    }
    
    @objc func handleCustomFBLogin() {
        FBSDKLoginManager().logIn(withReadPermissions: ["email"], from: self) { (result, err) in
            if err != nil {
                print("Custom FB Login failed:", err ?? "")
                return
            }
            self.showEmailAddress()
        }
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
        Auth.auth().signIn(with: credentials, completion: { (user, error) in
            if error != nil {
                let duplicateUserError:UIAlertView = UIAlertView(title: "Please try again", message: "\(error!.localizedDescription)", delegate: self, cancelButtonTitle: "Cancel")
                duplicateUserError.show()
                try! Auth.auth().signOut()
                print("Something went wrong with our FB user: ", error ?? "")
                return
            }
            self.performSegue(withIdentifier: "logInSegue", sender: self)
            print("Successfully logged in with our user: ", user ?? "")
        })
        FBSDKGraphRequest(graphPath: "/me", parameters: ["fields": "id, name, email"]).start { (connection, result, err) in
            if err != nil {
                print("Failed to start graph request:", err ?? "")
                return
            }
            print(result ?? "")
        }
    }
    
    func setlogInButtonButton(enabled:Bool) {
        if enabled {
           logInButton.alpha = 1.0
            logInButton.isEnabled = true
        } else {
            logInButton.alpha = 0.5
            logInButton.isEnabled = false
        }
    }
    
    //email sign in
    @objc func handleSignIn() {
        guard let email = emailTextField.text else { return }
        guard let password = passwordTextField.text else { return }
        
        Auth.auth().signIn(withEmail: email, password: password) { user, error in
            if error == nil && user != nil {
                self.performSegue(withIdentifier: "logInSegue", sender: self)
            } else if email.isEmpty || password.isEmpty {
                let emptyFieldsError:UIAlertView = UIAlertView(title: "Please try again", message: "Please fill in all the fields so we can get you logged in to your account.", delegate: self, cancelButtonTitle: "Try again")
                emptyFieldsError.show()
            } else {
                print("Error logging in: \(error!.localizedDescription)")
                let wrongFieldsError:UIAlertView = UIAlertView(title: "Incorrect Details", message: "Email or Password entered is incorrect! Please try again.", delegate: self, cancelButtonTitle: "Try again")
                wrongFieldsError.show()
            }
        }
    }

    
    @IBAction func toSignUpPagePressed(_ sender: Any) {
        self.performSegue(withIdentifier: "toSignUpSegue", sender: self)
    }
    

}
