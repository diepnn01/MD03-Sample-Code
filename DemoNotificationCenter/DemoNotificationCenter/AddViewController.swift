//
//  AddViewController.swift
//  DemoNotificationCenter
//
//  Created by Điệp Nguyễn on 9/26/16.
//  Copyright © 2016 Moboco. All rights reserved.
//

import UIKit

class AddViewController: UIViewController {
    @IBOutlet weak var textfield: UITextField!
    @IBOutlet weak var btnAdd: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func addAction(sender: AnyObject) {
        self.view.endEditing(true)
        
        if let temp = self.textfield.text {
            let userInfo = NSMutableDictionary(object: temp, forKey: "NewData")
            
            userInfo.setObject("objectTest", forKey: "test")
            
            NSNotificationCenter.defaultCenter().postNotificationName(nameNoticationWhenDatachange, object: nil, userInfo: userInfo as [NSObject : AnyObject])
        }
    }

}
