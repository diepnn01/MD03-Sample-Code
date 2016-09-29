//
//  ViewController.swift
//  DemoSwipeGesture
//
//  Created by Điệp Nguyễn on 9/29/16.
//  Copyright © 2016 Moboco. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var label: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    @IBAction func actionRight(sender: UISwipeGestureRecognizer) {
        self.label.text = "Right"
    }
    @IBAction func actionLeft(sender: UISwipeGestureRecognizer) {
        self.label.text = "Left"
    }
    @IBAction func actionDown(sender: UISwipeGestureRecognizer) {
        self.label.text = "Down"
    }
    
    @IBAction func actionUp(sender: UISwipeGestureRecognizer) {
        self.label.text = "Up"
    }
    
    override func motionEnded(motion: UIEventSubtype, withEvent event: UIEvent?) {
        if motion == .MotionShake {
            label.text = "Shake"
        }
    }
    

}

