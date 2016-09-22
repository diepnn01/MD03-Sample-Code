//
//  CustomTableViewCell.swift
//  DemoCustomTableviewCell
//
//  Created by Điệp Nguyễn on 9/8/16.
//  Copyright © 2016 Moboco. All rights reserved.
//

import UIKit

class CustomTableViewCell: UITableViewCell {
    @IBOutlet weak var button: UIButton!
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var imageLeft: UIImageView!

    var onFavourite: ((AnyObject) -> ())?
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    @IBAction func favouriteAction(sender: AnyObject) {
        self.onFavourite!(sender)
    }
    
    func setData (title: String, image: UIImage) {
        self.label.text = title
        self.imageLeft.image = image
    }
    
}
