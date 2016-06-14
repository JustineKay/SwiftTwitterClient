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

    override func viewDidLoad()
    {
        super.viewDidLoad()
        showLogInButton()
    }
    
    private func showLogInButton()
    {
        let logInButton = TWTRLogInButton(logInCompletion: { session, error in
            if (session != nil) {
                print("signed in as \(session!.userName)");
                self.presentUserTimelineVC()
            } else {
                print("error: \(error!.localizedDescription)");
            }
        })
        logInButton.center = self.view.center
        self.view.addSubview(logInButton)
    }
    
    private func presentUserTimelineVC()
    {
        let timelineVC = self.storyboard?.instantiateViewControllerWithIdentifier("UserTimelineVC")
        self.presentViewController(timelineVC!, animated: true, completion: nil)
    }
}

