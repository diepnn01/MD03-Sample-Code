//
//  ViewController.swift
//  DemoNotification
//
//  Created by Điệp Nguyễn on 5/30/16.
//  Copyright © 2016 Moboco. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.initLocalnotification()
    }
    
    func initLocalnotification() -> Void {
        
        let notification = UILocalNotification()
        
        notification.fireDate = NSDate(timeIntervalSinceNow: 20)
        notification.alertBody = "Hey you! Yeah you! Swipe to unlock!"
        notification.alertAction = "be awesome!"
        notification.soundName = UILocalNotificationDefaultSoundName
        notification.userInfo = ["CustomField1": "w00t"]
        notification.applicationIconBadgeNumber = 1
        
        UIApplication.sharedApplication().scheduleLocalNotification(notification)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

