//
//  FirstViewController.swift
//  DemoNotificationCenter
//
//  Created by Điệp Nguyễn on 6/1/16.
//  Copyright © 2016 Moboco. All rights reserved.
//

import UIKit

class FirstViewController: BaseViewController, UITableViewDelegate, UITableViewDataSource {
    @IBOutlet weak var tableview: UITableView!

    let identifier = "Cell"
    var listItems: NSMutableArray?
    let nameNotificationCenter = "nameNotificationCenter"
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "First"
     
        
        let addButton = UIBarButtonItem(title: "Add", style: .Done, target: self, action: #selector(FirstViewController.addAction(_:)))
        self.navigationItem.rightBarButtonItem = addButton
        
        
        listItems = NSMutableArray(array: ["nam", "Lan"])

        self.tableview.delegate = self
        self.tableview.dataSource = self
        self.tableview.registerClass(UITableViewCell.self, forCellReuseIdentifier: identifier)
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector: #selector(FirstViewController.hasChangeData(_:)), name: nameNotificationCenter, object: nil)
        
    }
    
    func hasChangeData(notification: NSNotification) -> Void {
        
        let myObject = notification.userInfo!["myObject"] as! String
        
        listItems?.addObject(myObject)
        
        tableview.reloadData()
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return (listItems?.count)!
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableview.dequeueReusableCellWithIdentifier(identifier, forIndexPath: indexPath)
        cell.textLabel?.text = listItems?.objectAtIndex(indexPath.row) as? String
        return cell
    }
    
    
    func addAction(sender: UIBarButtonItem) -> Void {
        let secondVC = SecondViewController(nibName: "SecondViewController", bundle: nil)
        self.navigationController?.pushViewController(secondVC, animated: true)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    deinit {
        NSNotificationCenter.defaultCenter().removeObserver(self)
    }
}
