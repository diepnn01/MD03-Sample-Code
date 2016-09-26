//
//  ViewController.swift
//  DemoCollectionView
//
//  Created by Điệp Nguyễn on 5/22/16.
//  Copyright © 2016 Moboco. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.edgesForExtendedLayout = .None
        self.collectionView.registerClass(UICollectionViewCell.self, forCellWithReuseIdentifier: "cell")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}

extension ViewController: UICollectionViewDelegate {
    
}

extension ViewController: UICollectionViewDataSource {
    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 2
    }
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 100
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("cell", forIndexPath: indexPath)
        cell.backgroundColor = UIColor.redColor()
        return cell
    }
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSizeMake(0, 30)
    }
    
    func collectionView(collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, atIndexPath indexPath: NSIndexPath) -> UICollectionReusableView {
        
        var viewHeader = UICollectionReusableView(frame: CGRectMake(0,0,30,30))
        
        if kind == UICollectionElementKindSectionHeader{
            viewHeader = collectionView.dequeueReusableSupplementaryViewOfKind(UICollectionElementKindSectionHeader, withReuseIdentifier: "headerIdentifier", forIndexPath: indexPath)
            
            let labelTitle = UILabel(frame: CGRectMake(5,0, viewHeader.bounds.size.width - 10, 30))
            labelTitle.text = "Title"
            labelTitle.backgroundColor = UIColor.whiteColor()
            viewHeader.addSubview(labelTitle)
            labelTitle.center = viewHeader.center
            viewHeader.backgroundColor = UIColor.blueColor()
        }
        else if kind == UICollectionElementKindSectionFooter{
            //
        }
        
        return viewHeader
    }
}

extension ViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
        
        let sizeS = UIScreen.mainScreen().bounds.width
        return CGSize(width: (sizeS/4) - 15, height: 100)
    }
}

