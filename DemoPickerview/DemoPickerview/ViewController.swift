//
//  ViewController.swift
//  DemoPickerview
//
//  Created by Điệp Nguyễn on 5/23/16.
//  Copyright © 2016 Moboco. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    let listLeft = ["1","2","3", "4", "5", "6"]
    let listRight = ["one", "Two", "Three", "Four", "Five", "Six"]
    var arr: [[Int]] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        arr.append([1])
        arr[0].append(2)
//        for i in 0...9 {
//            print(i)
//            for j in 0...9 {
//                arr[i].append(j)
//            }
//        }
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

extension ViewController: UIPickerViewDataSource {
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
}

extension ViewController: UIPickerViewDelegate {
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
            print("left value: \(listLeft[row])")
        }
        else {
            print("right value: \(listRight[row])")
        }
    }
}

