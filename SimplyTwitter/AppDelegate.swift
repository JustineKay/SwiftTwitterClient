//
//  AppDelegate.swift
//  SimplyTwitter
//
//  Created by Justine Kay on 6/13/16.
//  Copyright © 2016 Justine Kay. All rights reserved.
//

import UIKit
import Fabric
import TwitterKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    
    func application(application: UIApplication, willFinishLaunchingWithOptions launchOptions: [NSObject : AnyObject]?) -> Bool {
        
        Fabric.with([Twitter.self()])
        
        return true
    }

    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        
        let store = Twitter.sharedInstance().sessionStore
        let userID = store.session()?.userID
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        
        if userID != nil {
            let initialVC = storyboard.instantiateViewControllerWithIdentifier("UserTimelineVC")
            self.window?.rootViewController = initialVC
            self.window?.makeKeyAndVisible()
        } else {
            let initialVC = storyboard.instantiateViewControllerWithIdentifier("LogInVC")
            self.window?.rootViewController = initialVC
            self.window?.makeKeyAndVisible()
        }
        
        return true
    }
    func application(app: UIApplication, openURL url: NSURL, options: [String : AnyObject]) -> Bool {
        if Twitter.sharedInstance().application(app, openURL: url, options: options) {
            return true
        }
        return false
    }
}

