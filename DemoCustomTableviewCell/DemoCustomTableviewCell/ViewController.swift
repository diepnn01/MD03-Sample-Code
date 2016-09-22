//
//  ViewController.swift
//  DemoCustomTableviewCell
//
//  Created by Điệp Nguyễn on 9/8/16.
//  Copyright © 2016 Moboco. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    private let identifier = "CustomTableViewCell"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.edgesForExtendedLayout = .None
        self.setupTableView()
    }
    
    private func setupTableView() {
        self.tableView.registerNib(UINib.init(nibName: identifier, bundle: nil), forCellReuseIdentifier: identifier)
        self.tableView.separatorStyle = .None
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    private func favourite(index: NSInteger) {
        switch index {
        case 0:
            self.performSegueWithIdentifier("toSecondVC", sender: nil)
            break
        case 1:
            self.performSegueWithIdentifier("toThirdVC", sender: nil)
            break
        case 2:
            self.performSegueWithIdentifier("toFourVC", sender: nil)
            break
        default:
            self.performSegueWithIdentifier("toFiveVC", sender: nil)
            break
        }
        
    }
}

extension ViewController: UITableViewDataSource {
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier(identifier, forIndexPath: indexPath) as? CustomTableViewCell
        
        cell?.setData("test test", image: UIImage(named: "france")!)
        cell?.onFavourite = { [weak self]sender in
            if let strongSelf = self {
                strongSelf.favourite(indexPath.row)
            }
        }
        
        return cell!
    }
}

extension ViewController: UITableViewDelegate {
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 68
    }
}



