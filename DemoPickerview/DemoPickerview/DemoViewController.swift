//
//  DemoViewController.swift
//  DemoPickerview
//
//  Created by Điệp Nguyễn on 5/23/16.
//  Copyright © 2016 Moboco. All rights reserved.
//

import UIKit

class DemoViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {

    @IBOutlet weak var pickerView: UIPickerView!
    
    let listLeft = ["1","2","3", "4", "5", "6"]
    let listRight = ["one", "Two", "Three", "Four", "Five", "Six"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.pickerView.delegate = self
        self.pickerView.dataSource = self
    }
    
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 2
    }
    
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if component == 0 {
            return listLeft.count
        }
        else {
            return listRight.count
        }
        
    }
    
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if component == 0 {
            return listLeft[row]
        }
        else {
            return listRight[row]
        }
    }
    
    
    func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if component == 0 {
            /// trong trường hợp có mảng đầu vào
            print("Left value \(listLeft[row])")
            
            /// trong trường hợp ko có mảng đầu vào
            let dsds = self.pickerView.delegate
            print("left value \(dsds?.pickerView!(self.pickerView, titleForRow: row, forComponent: component))")
        }
        else {
            print("right value \(listRight[row])")
        }
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
