//
//  UserTimelineViewController.swift
//  SimplyTwitter
//
//  Created by Justine Kay on 6/13/16.
//  Copyright © 2016 Justine Kay. All rights reserved.
//

import UIKit
import TwitterKit

class UserTimelineViewController: TWTRTimelineViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let client = TWTRAPIClient()
        self.dataSource = TWTRUserTimelineDataSource(screenName: "", APIClient: client)
    }

}
