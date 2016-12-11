//
//  LFLoginViewController.swift
//  Finch
//
//  Created by Maarten de Vries on 11-12-16.
//  Copyright © 2016 Wrappic. All rights reserved.
//

import Foundation
import UIKit

class LFLoginViewController: UIViewController, FBSDKLoginButtonDelegate {
    
    var player: SPTAudioStreamingController?
    
    var auth: SPTAuth?
    var authViewController: UIViewController?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let token = FBSDKAccessToken.current() {
            // There is a acces token
        }
        
        let loginButton = FBSDKLoginButton()
        loginButton.readPermissions = ["public_profile", "email", "user_friends"]
        loginButton.delegate = self
        
        loginButton.center = self.view.center
        self.view.addSubview(loginButton)
        
        
    }
    
    /* MARK: Facebook login button delegate */
    
    func loginButton(_ loginButton: FBSDKLoginButton!, didCompleteWith result: FBSDKLoginManagerLoginResult!, error: Error!) {
        
        let credential = FIRFacebookAuthProvider.credential(withAccessToken: FBSDKAccessToken.current().tokenString)
        FIRAuth.auth()?.signIn(with: credential) { (user, error) in
            // ...
            if let error = error {
                // ...
                return
            }
        }
    }

    func loginButtonDidLogOut(_ loginButton: FBSDKLoginButton!) {
        //
    }
    
}
