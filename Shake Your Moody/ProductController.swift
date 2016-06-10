//
//  ProductController.swift
//  Shake Your Moody
//
//  Created by Robin PAUQUET on 10/06/2016.
//  Copyright © 2016 Robin PAUQUET. All rights reserved.
//


import UIKit
class ProductController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {
    
    @IBOutlet weak var stack: UIStackView!
    @IBOutlet weak var imgBack: UIImageView!
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var imgCoeur: UIButton!
    @IBOutlet weak var lstTag: UIStackView!
    @IBOutlet weak var lblAbout: UILabel!
    @IBOutlet weak var tvAbout: UITextView!
    @IBOutlet weak var lstTags: UIScrollView!
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    
    var product:Product!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        product = ProductsManager.sharedInstance.getActualProduct()
        
        
        
        imgBack.downloadedFrom(link: product.picture, contentMode: .ScaleAspectFill)
        lblTitle.text = product.title
        tvAbout.text = product.about
        lblAbout.text = "Description"
               
        
        
        
        if (NSUserDefaults.standardUserDefaults().boolForKey("product_id_" + product.id)){
            imgCoeur.setBackgroundImage(UIImage(named:"coeur_plein"), forState: UIControlState.Normal)
        } else {
            imgCoeur.setBackgroundImage(UIImage(named:"coeur_vide"), forState: UIControlState.Normal)
        }
        
        //First get the nsObject by defining as an optional anyObject
       
        
    }
    @IBAction func coeurClick(sender: AnyObject) {
        if (NSUserDefaults.standardUserDefaults().boolForKey("product_id_" + product.id)){
            NSUserDefaults.standardUserDefaults().setBool(false, forKey: "product_id_" + product.id)
            imgCoeur.setBackgroundImage(UIImage(named:"coeur_vide"), forState: UIControlState.Normal)
        } else {
            NSUserDefaults.standardUserDefaults().setBool(true, forKey: "product_id_" + product.id)
            imgCoeur.setBackgroundImage(UIImage(named:"coeur_plein"), forState: UIControlState.Normal)
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    let reuseIdentifier = "cell" // also enter this string as the cell identifier in the storyboard
    
    
    // MARK: - UICollectionViewDataSource protocol
    
    // tell the collection view how many cells to make
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return ProductsManager.sharedInstance.getActualProduct().tags.count
    }
    
    // make a cell for each cell index path
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        
        // get a reference to our storyboard cell
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier(reuseIdentifier, forIndexPath: indexPath) as! CollectionTagsCell
        
        // Use the outlet in our custom class to get a reference to the UILabel in the cell
        cell.myLabel.text = ProductsManager.sharedInstance.getActualProduct().tags[indexPath.item]
        cell.backgroundColor = UIColor.darkGrayColor() // make cell more visible in our example project
        cell.layer.borderColor = UIColor.grayColor().CGColor
        cell.layer.borderWidth = 1
        cell.layer.cornerRadius = 8
        
        return cell
    }
    
    // change background color when user touches cell
    func collectionView(collectionView: UICollectionView, didHighlightItemAtIndexPath indexPath: NSIndexPath) {
       // let cell = collectionView.cellForItemAtIndexPath(indexPath)
       // cell?.backgroundColor = UIColor.redColor()
    }
    
    // change background color back when user releases touch
    func collectionView(collectionView: UICollectionView, didUnhighlightItemAtIndexPath indexPath: NSIndexPath) {
        //let cell = collectionView.cellForItemAtIndexPath(indexPath)
        //cell?.backgroundColor = UIColor.yellowColor()
    }
    
    // MARK: - UICollectionViewDelegate protocol
    
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        // handle tap events
        //ProductsManager.sharedInstance.setActualProduct(indexPath.item)
        // print("You selected cell #\(indexPath.item)!")
    }
    

    
}