 //
//  AppDelegate.swift
//  Vehement
//
//  Created by Marcus Lewis on 05/02/2018.
//  Copyright © 2018 Marcus Lewis. All rights reserved.
//

import UIKit
import FBSDKCoreKit
import Firebase
import GoogleSignIn
import UserNotifications
import FirebaseAuth
import AVFoundation

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate, GIDSignInDelegate {
    
    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        FirebaseApp.configure()
        if #available(iOS 11, *) {
            let authOptions: UNAuthorizationOptions = [.alert, .badge, .sound]
            UNUserNotificationCenter.current().requestAuthorization(options: authOptions, completionHandler: { (granted, error) in })
            application.registerForRemoteNotifications()
        } else {
            let notificationSettings = UIUserNotificationSettings(types: [.alert, .badge, .sound], categories: nil)
            UIApplication.shared.registerUserNotificationSettings(notificationSettings)
            UIApplication.shared.registerForRemoteNotifications()
        }
        GIDSignIn.sharedInstance().clientID = FirebaseApp.app()?.options.clientID
        GIDSignIn.sharedInstance().delegate = self
        FBSDKApplicationDelegate.sharedInstance().application(application, didFinishLaunchingWithOptions: launchOptions)
        
        
        let audioSession = AVAudioSession.sharedInstance()
        do {
            try audioSession.setCategory(AVAudioSessionCategoryPlayback)
        }
        catch {
            print("Setting category to AVAudioSessionCategoryPlayback failed.")
        }
        
        
        return true
    }
    
    func sign(_ signIn: GIDSignIn!, didSignInFor user: GIDGoogleUser!, withError error: Error!) {
        if let err = error {
            print("Failed to log into Google: ", err)
            return
        }
        
        print("Successfully logged into Google", user)
        
        
        guard let idToken = user.authentication.idToken else { return }
        guard let accessToken = user.authentication.accessToken else { return }
        let credentials = GoogleAuthProvider.credential(withIDToken: idToken, accessToken: accessToken)
        
        Auth.auth().signIn(with: credentials, completion: { (user, error) in
            if let err = error {
                let duplicateUserError:UIAlertView = UIAlertView(title: "Please try again", message: "\(error!.localizedDescription)", delegate: self, cancelButtonTitle: "Cancel")
                duplicateUserError.show()
                print("Failed to create a Firebase User with Google account: ", err)
                return
            }
            guard let uid = user?.uid else { return }
            print("Successfully logged into Firebase with Google", uid)
    
            // switch root view controllers
            let storyboard = UIStoryboard.init(name: "Main", bundle: nil)
            let nav = storyboard.instantiateViewController(withIdentifier: "MainPageVC")
            self.window?.rootViewController = nav
            
        })
    }
    
    
    func application(_ app: UIApplication, open url: URL, options: [UIApplicationOpenURLOptionsKey : Any] = [:]) -> Bool {
        
        let handled = FBSDKApplicationDelegate.sharedInstance().application(app, open: url, sourceApplication: options[UIApplicationOpenURLOptionsKey.sourceApplication] as! String!, annotation: options[UIApplicationOpenURLOptionsKey.annotation])
        
        GIDSignIn.sharedInstance().handle(url,
                                          sourceApplication: options[UIApplicationOpenURLOptionsKey.sourceApplication] as! String!,
                                          annotation: options[UIApplicationOpenURLOptionsKey.annotation])
        
        return handled
    }



}
