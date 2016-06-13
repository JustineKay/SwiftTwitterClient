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
        
        if userID == nil {
            showLogInButton()
        } else {
            presentUserTimelineVC()
        }
    }
    
    func showLogInButton()
    {
        let logInButton = TWTRLogInButton(logInCompletion: { session, error in
            if (session != nil) {
                print("signed in as \(session!.userName)");
            } else {
                print("error: \(error!.localizedDescription)");
            }
        })
        logInButton.center = self.view.center
        self.view.addSubview(logInButton)
    }
    
    func presentUserTimelineVC()
    {
        let timelineVC = self.storyboard?.instantiateViewControllerWithIdentifier("UserTimelineVC")
        self.presentViewController(timelineVC!, animated: true, completion: nil)
    }
}

