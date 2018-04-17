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
    @IBOutlet weak var emailLabel: UILabel!
    
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
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.emailLabel.text = Auth.auth().currentUser?.email
    }
    
    
    @objc func handleSelectProfileImageView() {
        let pickerController = UIImagePickerController()
        pickerController.delegate = self
        present(pickerController, animated: true, completion: nil)
    }
    
}

extension ProfileVC: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    var imageReference: StorageReference {
        return Storage.storage().reference().child("images")
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        print("did Finish Picking Media")
        if let image = info["UIImagePickerControllerOriginalImage"] as? UIImage{
            selectedImage = image
            profileImage.image = image
            guard let imageData = UIImageJPEGRepresentation(image, 1) else { return }
            let filename = "userImage.jpg"
            let uploadImageRef = imageReference.child(filename)
            let uploadTask = uploadImageRef.putData(imageData, metadata: nil) { (metadata, error) in
                print("UPLOAD TASK FINISHED")
            }
        }
        let filename = "userImage.jpg"
        let downloadImageRef = imageReference.child(filename)
        let downloadTask = downloadImageRef.getData(maxSize:1024 * 1024 * 12) { (data, error) in
            if let data = data {
                let image = UIImage(data: data)
                self.selectedImage = image
                self.profileImage.image = image
            }
            print(error ?? "No error")
            self.dismiss(animated: true, completion: nil)
        }
        
    }
    
    
    
}
