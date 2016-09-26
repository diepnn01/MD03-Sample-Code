//
//  ViewController.swift
//  DemoNotificationCenter
//
//  Created by Điệp Nguyễn on 6/1/16.
//  Copyright © 2016 Moboco. All rights reserved.
//

import UIKit

let nameNoticationWhenDatachange = "nameNoticationWhenDatachange"

class ViewController: UIViewController {
    
    
    @IBOutlet weak var tableView: UITableView!
    
    var listItems = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.edgesForExtendedLayout = .None
        self.tableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: "cell")
        self.registerNotificationCenter()
    }
    
    
    func registerNotificationCenter() {
        NSNotificationCenter.defaultCenter().addObserver(self, selector: #selector(ViewController.updateData(_:)), name: nameNoticationWhenDatachange, object: nil)
    }
    
    @objc private func updateData(noti: NSNotification) {
        print("test \(noti.userInfo!["test"])")
        
        if let object = noti.userInfo!["NewData"] as? String {
            listItems.append(object)
            tableView.reloadData()
        }
    }
    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}

extension ViewController: UITableViewDelegate {

}

extension ViewController: UITableViewDataSource {
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listItems.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath)
        cell.textLabel?.text = listItems[indexPath.row]
        return cell
    }
}

