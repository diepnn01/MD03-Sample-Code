//
//  CustomCollectionViewCell.swift
//  DemoCollectionViewVTC
//
//  Created by Điệp Nguyễn on 5/25/16.
//  Copyright © 2016 Moboco. All rights reserved.
//

import UIKit

class CustomCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var imageV: UIImageView!

    @IBOutlet weak var btnLeft: UIButton!
    
    @IBOutlet weak var btnRight: UIButton!
    
    @IBAction func actionLeft(sender: AnyObject) {
        
    }
    
    @IBAction func actionRight(sender: AnyObject) {
        
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.layer.cornerRadius = 8
        self.layer.borderWidth = 1
        self.layer.borderColor = UIColor.redColor().CGColor
    }

}
