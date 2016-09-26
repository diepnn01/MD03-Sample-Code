//
//  SecondViewController.swift
//  DemoNotificationCenter
//
//  Created by Điệp Nguyễn on 6/1/16.
//  Copyright © 2016 Moboco. All rights reserved.
//

import UIKit

class SecondViewController: BaseViewController {

    @IBOutlet weak var textfield: UITextField!
    @IBOutlet weak var btnDone: UIButton!
    
    @IBAction func actionDone(sender: AnyObject) {
        self.showMessage(textfield.text!)
    }
    
    
    func showMessage(message:String) -> Void {
        let alertVC = UIAlertController(title: "Good", message: "add success", preferredStyle: .Alert)
        
        let alertAction = UIAlertAction(title: "Cancel", style: .Cancel) { (action:UIAlertAction) in
            
            let userInfo = NSMutableDictionary()
            userInfo.setObject(message, forKey: "myObject")
        NSNotificationCenter.defaultCenter().postNotificationName("nameNotificationCenter", object: nil, userInfo: userInfo as [NSObject : AnyObject])
            
        }
        
        alertVC.addAction(alertAction)
        self.presentViewController(alertVC, animated: true, completion: nil)
    }
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Second"
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
