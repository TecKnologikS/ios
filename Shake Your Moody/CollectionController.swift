//
//  CollectionController.swift
//  Shake Your Moody
//
//  Created by Robin PAUQUET on 08/06/2016.
//  Copyright © 2016 Robin PAUQUET. All rights reserved.
//

import UIKit

class CollectionController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {

    
    @IBOutlet weak var collectionView: UICollectionView!
    let reuseIdentifier = "cell" // also enter this string as the cell identifier in the storyboard
    
    
    // MARK: - UICollectionViewDataSource protocol
    
    // tell the collection view how many cells to make
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return ProductsManager.sharedInstance.getFilteredProducts().count
    }
    
    // make a cell for each cell index path
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        
        // get a reference to our storyboard cell
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier(reuseIdentifier, forIndexPath: indexPath) as! CollectionCellController
        
        // Use the outlet in our custom class to get a reference to the UILabel in the cell
        cell.myLabel.text = ProductsManager.sharedInstance.getFilteredProducts()[indexPath.item].title
        cell.myImage.downloadedFrom(link: ProductsManager.sharedInstance.getFilteredProducts()[indexPath.item].thumbnail, contentMode: .ScaleAspectFit)
        cell.backgroundColor = UIColor.yellowColor() // make cell more visible in our example project
        cell.layer.borderColor = UIColor.grayColor().CGColor
        cell.layer.borderWidth = 1
        cell.layer.cornerRadius = 8
        
        return cell
    }
    
    // change background color when user touches cell
    func collectionView(collectionView: UICollectionView, didHighlightItemAtIndexPath indexPath: NSIndexPath) {
        let cell = collectionView.cellForItemAtIndexPath(indexPath)
        cell?.backgroundColor = UIColor.redColor()
    }
    
    // change background color back when user releases touch
    func collectionView(collectionView: UICollectionView, didUnhighlightItemAtIndexPath indexPath: NSIndexPath) {
        let cell = collectionView.cellForItemAtIndexPath(indexPath)
        cell?.backgroundColor = UIColor.yellowColor()
    }
    
    // MARK: - UICollectionViewDelegate protocol
    
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        // handle tap events
        ProductsManager.sharedInstance.setActualProduct(indexPath.item)
       // print("You selected cell #\(indexPath.item)!")
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        self.becomeFirstResponder()
    }
    
    
    override func canBecomeFirstResponder() -> Bool {
        return true
    }
    
    override func motionEnded(motion: UIEventSubtype, withEvent event: UIEvent!) {
        if(event.subtype == UIEventSubtype.MotionShake) {
            shakeIt()
        }
    }
    
    /*@IBAction func rechercher(sender: AnyObject) {
        self.navigationController?.popToRootViewControllerAnimated(true)
    }*/
    @IBAction func shakeItItem(sender: AnyObject) {
        shakeIt()
    }
    func shakeIt() {
        ProductsManager.sharedInstance.shake()
        self.collectionView.reloadData()
    }
        
}
