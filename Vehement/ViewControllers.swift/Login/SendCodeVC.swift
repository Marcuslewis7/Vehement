//
//  SendCodeVC.swift
//  Vehement
//
//  Created by Marcus Lewis on 13/02/2018.
//  Copyright © 2018 Marcus Lewis. All rights reserved.
//

import UIKit
import AVFoundation
import UserNotifications
import FirebaseAuth

@IBDesignable
class SendCodeVC: UIViewController {
    
    //Outlets
    @IBOutlet weak var infomationTextLabel: UITextView!
    @IBOutlet weak var enterDetailsField: UITextField!
    @IBOutlet weak var topPicture: UITextView!
    @IBOutlet weak var bottomButton: UIButton!
    @IBOutlet weak var loginButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loginButton.isHidden = true
        bottomButton.isHidden = false
    }
    
    //Actions
    @IBAction func onSendPressed(_ sender: Any) {
        let sendSound: SystemSoundID = 1001
        AudioServicesPlaySystemSound (sendSound)
   
        let alert = UIAlertController(title: "Phone Number", message: "Is this your phone number? \n \(enterDetailsField.text!)", preferredStyle: .alert)
        let action = UIAlertAction(title: "Yes", style: .default) {
            (UIAlertAction) in PhoneAuthProvider.provider().verifyPhoneNumber("(+44)" + self.enterDetailsField.text!) {
                (verificationID, error) in
                if error != nil {
                    print ("insde SendCode, there is error")
                    let phoneNoFieldError:UIAlertView = UIAlertView(title: "Please try again", message: "\(error!.localizedDescription)", delegate: self, cancelButtonTitle: "Try again")
                    phoneNoFieldError.show()
                    print("error: \(String(describing: error?.localizedDescription))")
                } else {
                    print ("else  SendCode, going to move to next page")
                    let defaults = UserDefaults.standard
                    defaults.set(verificationID, forKey: "authVID")
                    self.enterDetailsField.text = ""
                    self.infomationTextLabel.text = "Verify Code"
                    self.topPicture.text = " 📩"
                    self.bottomButton.isHidden = true
                    self.loginButton.isHidden = false
                    self.enterDetailsField.placeholder = "Enter Code Recieved"
                }
            }
        }
        let cancel = UIAlertAction(title: "No", style: .cancel, handler: nil)
        alert.addAction(action)
        alert.addAction(cancel)
        self.present(alert, animated: true, completion: nil)
    }
    
    @IBAction func onLoginPressed(_ sender: Any) {
        let defaults = UserDefaults.standard
        let credential: PhoneAuthCredential = PhoneAuthProvider.provider().credential(withVerificationID: defaults.string(forKey: "authVID")!, verificationCode: enterDetailsField.text!)
        
        Auth.auth().signIn(with: credential) { (user, error) in
            if error != nil {
                print("sign in error")
                let phoneNoFieldError:UIAlertView = UIAlertView(title: "Error", message: "\(error!.localizedDescription)", delegate: self, cancelButtonTitle: "Try again")
                phoneNoFieldError.show()
            } else {
                print("Phone number: \(String(describing: user?.phoneNumber))")
                let userInfo = user?.providerData[0]
                print("Provider ID: \(String(describing: userInfo?.providerID))")
                self.dismiss(animated: false, completion: nil)
                self.performSegue(withIdentifier: "toMainPageSegue", sender: Any?.self)
                
            }
        }
    }
    
    @IBAction func onExitPressed(_ sender: Any) {
        self.presentingViewController?.dismiss(animated: false, completion:nil)
    }
    
    
    
    
}
