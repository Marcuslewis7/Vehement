//
//  CreatePostVC.swift
//  Vehement
//
//  Created by Marcus Lewis on 03/04/2018.
//  Copyright © 2018 Marcus Lewis. All rights reserved.
//

import UIKit
import Firebase

class CreatePostVC: UIViewController {

    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var textView: UITextView!
    @IBOutlet weak var sendButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        textView.delegate = self
        sendButton.bindToKeyboard()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        //self.emailLabel.text = Auth.auth().currentUser?.email
        self.emailLabel.text = Auth.auth().currentUser?.displayName
    }

    @IBAction func sendButtonPressed(_ sender: Any) {
        if textView.text != nil && textView.text != "SAY SOMETHING HERE..."  {
            sendButton.isEnabled = false
            SocialDataService.instance.uploadPost(withMessage: textView.text, forUID: (Auth.auth().currentUser?.uid)!, withGroupKey: nil, sendComplete: { (isComplete) in
                if isComplete {
                    self.sendButton.isEnabled = true
                    self.dismiss(animated: true, completion: nil)
                } else {
                    self.sendButton.isEnabled = true
                    print("there was an error")
                }
            })
        }
    }
    
}

extension CreatePostVC: UITextViewDelegate {
    func textViewDidBeginEditing(_ textView: UITextView) {
        textView.text = ""
    }
}
