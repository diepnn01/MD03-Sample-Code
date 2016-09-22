//
//  ViewController.swift
//  DemoScrollView
//
//  Created by Điệp Nguyễn on 5/25/16.
//  Copyright © 2016 Moboco. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var scrollView: UIScrollView!
    
    
    var heightScreen:CGFloat?
    var widthScreen:CGFloat?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        heightScreen = self.view.bounds.height
        widthScreen = self.view.bounds.width
        
        let button1 = UIButton(frame: CGRectMake(widthScreen!/2, 50, 80, 40 ))
        button1.backgroundColor = UIColor.blueColor()
        button1.setTitle("Button 1", forState: .Normal)
        
        
        let button2 = UIButton(frame: CGRectMake(widthScreen! * 3/2, 50, 80, 40 ))
        button2.backgroundColor = UIColor.blueColor()
        button2.setTitle("Button 2", forState: .Normal)
        
        let button3 = UIButton(frame: CGRectMake(widthScreen! * 5/2, 50, 80, 40 ))
        button3.backgroundColor = UIColor.blueColor()
        button3.setTitle("Button 3", forState: .Normal)
        
        let button4 = UIButton(frame: CGRectMake(widthScreen! * 7/2, 50, 80, 40 ))
        button4.backgroundColor = UIColor.blueColor()
        button4.setTitle("Button 4", forState: .Normal)
        
        self.scrollView.pagingEnabled = true
        self.scrollView.addSubview(button1)
        self.scrollView.addSubview(button2)
        self.scrollView.addSubview(button3)
        self.scrollView.addSubview(button4)
        
        self.scrollView.contentSize = CGSizeMake(widthScreen! * 4, heightScreen! * 2)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

