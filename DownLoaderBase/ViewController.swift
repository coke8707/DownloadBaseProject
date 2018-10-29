//
//  ViewController.swift
//  DownLoaderBase
//
//  Created by MiniMon on 29/10/2018.
//  Copyright © 2018 coke. All rights reserved.
//

import UIKit
import NotificationBannerSwift


class ViewController: BaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.initOrientalChangeNoti()
        // Do any additional setup after loading the view, typically from a nib.
    }

    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        NotificationBanner.init(title:"Sample Notifications").show()
    }
    
    
    override func initLayoutPortrait() {
        super.initLayoutPortrait()
        print("세로")
    }
    
    override func initLayoutLandScape() {
        super.initLayoutLandScape()
        print("가로")
    }
    

}

