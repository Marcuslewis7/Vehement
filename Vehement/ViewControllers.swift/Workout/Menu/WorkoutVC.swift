//
//  WorkoutVC.swift
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

class WorkoutVC: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var categoryTableView: UITableView!
    @IBOutlet weak var leadingViewConstraint: NSLayoutConstraint!
    @IBOutlet weak var myBlurView: UIVisualEffectView!
    @IBOutlet weak var mySlideView: UIView!
    
    var segueIdentifier = ["toAllWorkoutsVC","toFeaturedVC","toMyPlanVC","toOtherVC"]
    
    //////
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
    ////////
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        categoryTableView.dataSource = self
        categoryTableView.delegate = self
        displayWalkthroughs()
        
        mySlideView.layer.shadowColor = UIColor.black.cgColor
        mySlideView.layer.shadowOpacity = 1
        mySlideView.layer.shadowOffset = CGSize(width: 5, height: 5)
        leadingViewConstraint.constant = -215
        
        /////
        profileImage.layer.cornerRadius = 80
        profileImage.clipsToBounds = true
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(WorkoutVC.handleSelectProfileImageView))
        profileImage.addGestureRecognizer(tapGesture)
        profileImage.isUserInteractionEnabled = true
        ///////
    }
    ///////
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.emailLabel.text = Auth.auth().currentUser?.email
    }
    
    @objc func handleSelectProfileImageView() {
        let pickerController = UIImagePickerController()
        pickerController.delegate = self
        present(pickerController, animated: true, completion: nil)
    }
    ////////
    
    
    @IBOutlet weak var slideInButton: UIBarButtonItem!
    
    @IBAction func slideInButtonPressed(_ sender: Any) {
        UIView.animate(withDuration: 0.2, animations: {
            self.leadingViewConstraint.constant += 215
            self.view.layoutIfNeeded()
        })
    }
    
    @IBAction func panPerformed(_ sender: UIPanGestureRecognizer) {
        if sender.state == .began || sender.state == .changed {
            let myTranslation = sender.translation(in: self.view).x
            if myTranslation > 0 {
                if leadingViewConstraint.constant < 20 {
                    UIView.animate(withDuration: 0.2, animations: {
                        self.leadingViewConstraint.constant += myTranslation / 3
                        self.view.layoutIfNeeded()
                    })
                //self.leadingViewConstraint.constant += myTranslation
                }
            } else {
                if leadingViewConstraint.constant > -215 {
                    UIView.animate(withDuration: 0.2, animations: {
                        self.leadingViewConstraint.constant += myTranslation / 3
                        self.view.layoutIfNeeded()
                    })
                }
            }
        } else if sender.state == .ended {
            if leadingViewConstraint.constant < -100 {
                UIView.animate(withDuration: 0.2, animations: {
                    self.leadingViewConstraint.constant = -215
                    self.view.layoutIfNeeded()
                })
            } else {
                UIView.animate(withDuration: 0.2, animations: {
                    self.leadingViewConstraint.constant = 0
                    self.view.layoutIfNeeded()
                })
            }
        }
    }
    
    
    func displayWalkthroughs() {
        let userDefaults = UserDefaults.standard
        let displayedWalkthrough = userDefaults.bool(forKey: "DisplayedWalkthrough")
        if !displayedWalkthrough {
            if let pageViewController = storyboard?.instantiateViewController(withIdentifier: "PageViewController") {
                self.present(pageViewController, animated: true, completion: nil)
            }
        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        self.navigationController?.setNavigationBarHidden(false, animated: true)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return DataService.instance.getCategories().count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "CategoryCell") as? CategoryCell {
            let category = DataService.instance.getCategories()[indexPath.row]
            cell.updateViews(category: category)
            return cell
        } else {
            return CategoryCell()
        }
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let category = DataService.instance.getCategories()[indexPath.row]
             if indexPath.row == 0 { self.performSegue(withIdentifier: "toAllWorkoutsVC", sender: category)}
        else if indexPath.row == 1 { self.performSegue(withIdentifier: "toOtherVC", sender: category)}
        else if indexPath.row == 2 { self.performSegue(withIdentifier: "toFeaturedVC", sender: category)}
        else if indexPath.row == 3 { self.performSegue(withIdentifier: "toMyPlanVC", sender: category)}
        }
    
   override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let AllWorkoutsVC = segue.destination as? AllWorkoutsVC {
            assert(sender as? Category != nil)
            AllWorkoutsVC.initWorkouts(category: sender as! Category)
        }
    }
    
}

extension WorkoutVC: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
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
