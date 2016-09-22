//
//  CustomCellSecond.swift
//  DemoCustomTableviewCell
//
//  Created by Điệp Nguyễn on 9/12/16.
//  Copyright © 2016 Moboco. All rights reserved.
//

import UIKit

class CustomCellSecond: UITableViewCell {

    @IBOutlet weak var textfield: UITextField!
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func setData(index: NSInteger) {
        self.textfield.text = String.init(format: "%d", index)
    }

}
