//
//  CustomAnnotionView.swift
//  DemoMap
//
//  Created by Điệp Nguyễn on 6/13/16.
//  Copyright © 2016 Moboco. All rights reserved.
//

import UIKit
import MapKit

class CustomAnnotionView: MKAnnotationView {

    /*
    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func drawRect(rect: CGRect) {
        // Drawing code
    }
    */
    let selectedLabel:UILabel = UILabel.init(frame:CGRectMake(0, 0, 140, 38))
    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(false, animated: animated)
        
        if(selected)
        {
            // Do customization, for example:
            selectedLabel.text = "Hello World!!"
            selectedLabel.textAlignment = .Center
            selectedLabel.font = UIFont.init(name: "HelveticaBold", size: 15)
            selectedLabel.backgroundColor = UIColor.lightGrayColor()
            selectedLabel.layer.borderColor = UIColor.darkGrayColor().CGColor
            selectedLabel.layer.borderWidth = 2
            selectedLabel.layer.cornerRadius = 5
            selectedLabel.layer.masksToBounds = true
            
            selectedLabel.center.x = 0.5 * self.frame.size.width;
            selectedLabel.center.y = -0.5 * selectedLabel.frame.height;
            self.addSubview(selectedLabel)
        }
        else
        {
            selectedLabel.removeFromSuperview()
        }
    }

}
