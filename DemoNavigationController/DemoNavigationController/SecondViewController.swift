//
//  SecondViewController.swift
//  DemoNavigationController
//
//  Created by Điệp Nguyễn on 9/15/16.
//  Copyright © 2016 Moboco. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "second"
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func backToFirst(sender: AnyObject) {
        self.navigationController?.popViewControllerAnimated(true)
    }
    
    @IBAction func goToThird(sender: AnyObject) {
        let storyb = UIStoryboard.init(name: "Main", bundle: nil)
        let vc = storyb.instantiateViewControllerWithIdentifier("third")
        self.navigationController?.pushViewController(vc, animated: true)
    }
}
