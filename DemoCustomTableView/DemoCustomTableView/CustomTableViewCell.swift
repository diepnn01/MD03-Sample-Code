//
//  CustomTableViewCell.swift
//  DemoCustomTableView
//
//  Created by Điệp Nguyễn on 9/8/16.
//  Copyright © 2016 Moboco. All rights reserved.
//

import UIKit

class CustomTableViewCell: UITableViewCell {

    
    @IBOutlet weak var btnTest: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
