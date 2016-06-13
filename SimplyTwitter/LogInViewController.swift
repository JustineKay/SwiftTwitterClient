//
//  ViewController.swift
//  SimplyTwitter
//
//  Created by Justine Kay on 6/13/16.
//  Copyright © 2016 Justine Kay. All rights reserved.
//

import UIKit
import TwitterKit

class LogInViewController: UIViewController
{

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let store = Twitter.sharedInstance().sessionStore
        let userID = store.session()?.userID
        
        if userID != nil {
            store.logOutUserID(userID!)
            let logInButton = TWTRLogInButton(logInCompletion: { session, error in
                if (session != nil) {
                    print("signed in as \(session!.userName)");
                } else {
                    print("error: \(error!.localizedDescription)");
                }
            })
            logInButton.center = self.view.center
            self.view.addSubview(logInButton)
            
        } else {
            
            //TODO: segue to UserTimelineVC
        }
    }
}

