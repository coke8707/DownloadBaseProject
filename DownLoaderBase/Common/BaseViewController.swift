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
        self.initSubViews()
        self.initLayoutPortrait()
    }
    

    // Author : LKH
    // Date   : 2018.10.29
    // Desc   : 가로 / 세로 방향에 따라 UI가 변경이 되어야 한다면 이 메서드를 호출해야 하며
    //          initLayoutPortrait()/initLayoutLandScape() 메서드도 선언이 되어야 한다
    
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
    
    // Author : LKH
    // Date   : 2018.10.29
    // Desc   : ViewController Subviews의 addSubview
   
    func initSubViews() {
        
        
    }
    
    // Author : LKH
    // Date   : 2018.10.29
    // Desc   : 세로 방향의 오토레이아웃 설정
    
    func initLayoutPortrait() {
        
        
        
    }
    
    // Author : LKH
    // Date   : 2018.10.29
    // Desc   : 가로 방향의 오토레이아웃 설정
    
    func initLayoutLandScape() {
        
    }
    
    
    
    
    
    
    
    
    
}
