//
//  FiveViewController.swift
//  DemoCustomTableviewCell
//
//  Created by Điệp Nguyễn on 9/12/16.
//  Copyright © 2016 Moboco. All rights reserved.
//

import UIKit

class FiveViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func backto3Action(sender: AnyObject) {
        
        for vc in (self.navigationController?.viewControllers)! {
            if vc is ThirdViewController {
                self.navigationController?.popToViewController(vc, animated: true)
                return
            }
        }
        
        let storyboad = UIStoryboard(name: "Main", bundle: nil)
        
        let vc = storyboad.instantiateViewControllerWithIdentifier("ThirdViewController")
        
        self.navigationController?.pushViewController(vc, animated: true)
    }
}
