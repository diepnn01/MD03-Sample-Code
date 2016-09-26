//
//  FirstViewController.swift
//  DemoCollectionViewVTC
//
//  Created by Điệp Nguyễn on 5/25/16.
//  Copyright © 2016 Moboco. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    @IBOutlet weak var collectionView: UICollectionView!

    let reuseIdentifier = "cell"
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "First"
        self.collectionView.delegate = self
        self.collectionView.dataSource = self
        self.collectionView.backgroundColor = UIColor.whiteColor()
        
        self.collectionView.registerNib(UINib.init(nibName: "CustomCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "CustomCollectionViewCell")
    }
    
    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("CustomCollectionViewCell", forIndexPath: indexPath) as! CustomCollectionViewCell
        
        // Configure the cell
        
        cell.imageV.image = UIImage(named: "ic_phone")
        cell.btnLeft.setTitle("Cancel", forState: .Normal)
        cell.btnRight.setTitle("OK", forState: .Normal)
        return cell
    }
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
        
        return CGSizeMake(140, 140)
    }
    
    func collectionView(collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, atIndexPath indexPath: NSIndexPath) -> UICollectionReusableView {
        var viewHeader = UICollectionReusableView(frame: CGRectMake(0,0,30,30))
        
        if (kind == UICollectionElementKindSectionHeader){
            viewHeader = collectionView.dequeueReusableSupplementaryViewOfKind(UICollectionElementKindSectionHeader, withReuseIdentifier: "Myyyy", forIndexPath: indexPath)
            viewHeader.backgroundColor = UIColor.blueColor()
        }
        else {
        
        }
        
        return viewHeader;
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
}
