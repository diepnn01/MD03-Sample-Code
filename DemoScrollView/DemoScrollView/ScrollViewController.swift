//
//  ScrollViewController.swift
//  DemoScrollView
//
//  Created by Điệp Nguyễn on 5/25/16.
//  Copyright © 2016 Moboco. All rights reserved.
//

import UIKit

class ScrollViewController: UIViewController {
    @IBOutlet weak var scroolview: UIScrollView!
    
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
        
        self.scroolview.pagingEnabled = true
        self.scroolview.addSubview(button1)
        self.scroolview.addSubview(button2)
        self.scroolview.addSubview(button3)
        self.scroolview.addSubview(button4)
        
        self.scroolview.contentSize = CGSizeMake(widthScreen! * 4, heightScreen! * 2)
        
        
        self.view.addSubview(scroolview)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
