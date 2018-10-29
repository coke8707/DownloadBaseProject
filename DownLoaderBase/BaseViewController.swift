//
//  BaseViewController.swift
//  DownLoaderBase
//
//  Created by MiniMon on 29/10/2018.
//  Copyright © 2018 coke. All rights reserved.
//

import UIKit

class BaseViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        // Do any additional setup after loading the view.
    }
    

    func initOrientalChangeNoti() {
        
        NotificationCenter.default.addObserver(self, selector: #selector(willChangeOriental(noti:)), name: UIApplication.willChangeStatusBarOrientationNotification, object: nil)
    }

    @objc func willChangeOriental(noti:Notification) {
        
        let ori = noti.userInfo![UIApplication.statusBarOrientationUserInfoKey] as! Int
        
        let  orientation  = UIInterfaceOrientation(rawValue: ori)
        
        if orientation == UIInterfaceOrientation.portrait {
           self.initLayoutPortrait()
        }
        else {
           self.initLayoutLandScape()
        }
        
        
    }
    
    func initLayoutPortrait() {
        
        
        
    }
    
    func initLayoutLandScape() {
        
    }
    
    
    
    
    
    
    
    
    
}
