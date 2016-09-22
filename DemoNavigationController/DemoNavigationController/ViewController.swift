//
//  ViewController.swift
//  DemoNavigationController
//
//  Created by Điệp Nguyễn on 9/15/16.
//  Copyright © 2016 Moboco. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "First"
        
        let addButton = UIBarButtonItem(title: "Add", style: .Done, target: self, action: #selector(ViewController.addAction))
        let helpButton = UIBarButtonItem(image: UIImage(named: "map"), style: .Plain, target: self, action: #selector(ViewController.helpAction))
        
        self.navigationItem.rightBarButtonItems = [helpButton,addButton, helpButton]
        
        self.navigationItem.leftBarButtonItem = helpButton
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func helpAction() {
    
    }
    
    func addAction() {
    
    }

    @IBAction func goToSecond(sender: AnyObject) {
        let storyb = UIStoryboard.init(name: "Main", bundle: nil)
        let vc = storyb.instantiateViewControllerWithIdentifier("second")
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func goToThird(sender: AnyObject) {
        let storyb = UIStoryboard.init(name: "Main", bundle: nil)
        let vc = storyb.instantiateViewControllerWithIdentifier("third")
        self.navigationController?.pushViewController(vc, animated: true)
    }
}

