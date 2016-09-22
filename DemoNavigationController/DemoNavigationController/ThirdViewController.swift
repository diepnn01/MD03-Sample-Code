//
//  ThirdViewController.swift
//  DemoNavigationController
//
//  Created by Điệp Nguyễn on 9/15/16.
//  Copyright © 2016 Moboco. All rights reserved.
//

import UIKit

class ThirdViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "third"
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func backToFirst(sender: AnyObject) {
        for vc in (self.navigationController?.viewControllers)! {
            if vc is ViewController {
                self.navigationController?.popToViewController(vc, animated: true)
                break
            }
        }
    }
    
    @IBAction func backToSecond(sender: AnyObject) {
        self.navigationController?.popViewControllerAnimated(true)
    }
    
}
