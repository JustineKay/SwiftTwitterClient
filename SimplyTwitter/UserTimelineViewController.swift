//
//  UserTimelineViewController.swift
//  SimplyTwitter
//
//  Created by Justine Kay on 6/13/16.
//  Copyright © 2016 Justine Kay. All rights reserved.
//

import UIKit
import TwitterKit

class UserTimelineViewController: TWTRTimelineViewController
{
    private let store = Twitter.sharedInstance().sessionStore
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        loadUserTimeline()
    }
    
    private func loadUserTimeline()
    {
        let client = TWTRAPIClient()
        self.dataSource = TWTRUserTimelineDataSource(screenName: nil,
                                                     userID: store.session()?.userID,
                                                     APIClient: client,
                                                     maxTweetsPerRequest: 20,
                                                     includeReplies: true,
                                                     includeRetweets: true)
        self.showTweetActions = true
    }

    @IBAction func logOutUser(sender: UIButton)
    {
        self.store.logOutUserID((self.store.session()?.userID)!)
        presentLogInVC()
    }
    
    private func presentLogInVC()
    {
        let logInVC = self.storyboard?.instantiateViewControllerWithIdentifier("LogInVC")
        self.presentViewController(logInVC!, animated: true, completion: nil)
    }
}
