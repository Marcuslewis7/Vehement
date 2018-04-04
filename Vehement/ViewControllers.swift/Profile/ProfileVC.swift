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
import FirebaseDatabase
import FirebaseStorage

class ProfileVC: UIViewController {

    @IBOutlet weak var logOutButton: UIButton!
    @IBOutlet weak var profileImage: UIImageView!
    var selectedImage: UIImage?
    
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

        profileImage.layer.cornerRadius = 100
        profileImage.clipsToBounds = true
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(ProfileVC.handleSelectProfileImageView))
        profileImage.addGestureRecognizer(tapGesture)
        profileImage.isUserInteractionEnabled = true
    }
    
    
    @objc func handleSelectProfileImageView() {
        let pickerController = UIImagePickerController()
        pickerController.delegate = self
        present(pickerController, animated: true, completion: nil)
    }

}

extension ProfileVC: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        print("did Finish Picking Media")
        if let image = info["UIImagePickerControllerOriginalImage"] as? UIImage{
            selectedImage = image
            profileImage.image = image
        }
    
        
        dismiss(animated: true, completion: nil)
    }
}
