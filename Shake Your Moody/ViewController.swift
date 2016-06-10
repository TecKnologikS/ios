//
//  ViewController.swift
//  Shake Your Moody
//
//  Created by Robin PAUQUET on 07/06/2016.
//  Copyright © 2016 Robin PAUQUET. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var hair: UISwitch!
    @IBOutlet weak var skin: UISwitch!
    @IBOutlet weak var sex: UISwitch!
    @IBOutlet weak var imgMoi: UIImageView!
    
    @IBOutlet weak var btnClair: UIButton!
    @IBOutlet weak var btnCheveuxFonce: UIButton!
    @IBOutlet weak var btnSkinClair: UIButton!
    @IBOutlet weak var btnSkinFonce: UIButton!
    @IBOutlet weak var btnSexMale: UIButton!
    @IBOutlet weak var btnSexFemale: UIButton!
    
    
    let bold:UIFont = UIFont.boldSystemFontOfSize(15.0)
    let nobold:UIFont = UIFont.systemFontOfSize(15.0)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        ProductsManager.sharedInstance.setProducts(Parser(adresse: "http://163.172.27.134/api/products").getProducts())
        
        ProductsManager.sharedInstance.setHair(NSUserDefaults.standardUserDefaults().boolForKey("hair_b"), dark: NSUserDefaults.standardUserDefaults().boolForKey("hair_d"))
        ProductsManager.sharedInstance.setSkin(NSUserDefaults.standardUserDefaults().boolForKey("skin_b"), dark: NSUserDefaults.standardUserDefaults().boolForKey("skin_d"))
        ProductsManager.sharedInstance.setSex(NSUserDefaults.standardUserDefaults().boolForKey("sex_m"), female: NSUserDefaults.standardUserDefaults().boolForKey("sex_f"))
        
        sex.on = NSUserDefaults.standardUserDefaults().boolForKey("sex")
        hair.on = NSUserDefaults.standardUserDefaults().boolForKey("hair")
        skin.on = NSUserDefaults.standardUserDefaults().boolForKey("skin")
        
        if (NSUserDefaults.standardUserDefaults().boolForKey("hair_b")) {
            btnClair.titleLabel!.font = bold
            btnCheveuxFonce.titleLabel!.font = nobold
        } else {
            btnClair.titleLabel!.font = nobold
            btnCheveuxFonce.titleLabel!.font = bold
        }
        if (NSUserDefaults.standardUserDefaults().boolForKey("skin_b")) {
            btnSkinClair.titleLabel!.font = bold
            btnSkinFonce.titleLabel!.font = nobold
        } else {
            btnSkinClair.titleLabel!.font = nobold
            btnSkinFonce.titleLabel!.font = bold
        }
        if (NSUserDefaults.standardUserDefaults().boolForKey("sex_m")) {
            btnSexMale.titleLabel!.font = bold
            btnSexFemale.titleLabel!.font = nobold
        } else {
            btnSexMale.titleLabel!.font = nobold
            btnSexFemale.titleLabel!.font = bold
        }
        
        updateImage()
        
        //var products:[Product] = jsonToData(getJSON("http://163.172.27.134/api/products"))
        //test
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        Next()
    }

    func Next() {
        ProductsManager.sharedInstance.setMe(hair.on, skin: skin.on, sex: sex.on)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func click(sender: AnyObject) {
        switch sender as! UIButton {
            case btnClair:
                ProductsManager.sharedInstance.setHair(true, dark: false)
                btnClair.titleLabel!.font = bold
                btnCheveuxFonce.titleLabel!.font = nobold
                NSUserDefaults.standardUserDefaults().setObject(true, forKey: "hair_b")
                NSUserDefaults.standardUserDefaults().setObject(false, forKey: "hair_d")
            case btnCheveuxFonce:
                ProductsManager.sharedInstance.setHair(false, dark: true)
                btnClair.titleLabel!.font = nobold
                btnCheveuxFonce.titleLabel!.font = bold
                NSUserDefaults.standardUserDefaults().setObject(false, forKey: "hair_b")
                NSUserDefaults.standardUserDefaults().setObject(true, forKey: "hair_d")
            case btnSkinClair:
                ProductsManager.sharedInstance.setSkin(true, dark: false)
                btnSkinClair.titleLabel!.font = bold
                btnSkinFonce.titleLabel!.font = nobold
                NSUserDefaults.standardUserDefaults().setObject(true, forKey: "skin_b")
                NSUserDefaults.standardUserDefaults().setObject(false, forKey: "skin_d")
            case btnSkinFonce:
                ProductsManager.sharedInstance.setSkin(false, dark: true)
                btnSkinClair.titleLabel!.font = nobold
                btnSkinFonce.titleLabel!.font = bold
                NSUserDefaults.standardUserDefaults().setObject(false, forKey: "skin_b")
                NSUserDefaults.standardUserDefaults().setObject(true, forKey: "skin_d")
            case btnSexMale:
                ProductsManager.sharedInstance.setSex(true, female: false)
                btnSexMale.titleLabel!.font = bold
                btnSexFemale.titleLabel!.font = nobold
                NSUserDefaults.standardUserDefaults().setObject(true, forKey: "sex_m")
                NSUserDefaults.standardUserDefaults().setObject(false, forKey: "sex_f")
            case btnSexFemale:
                ProductsManager.sharedInstance.setSex(false, female: true)
                btnSexMale.titleLabel!.font = nobold
                btnSexFemale.titleLabel!.font = bold
                NSUserDefaults.standardUserDefaults().setObject(false, forKey: "sex_m")
                NSUserDefaults.standardUserDefaults().setObject(true, forKey: "sex_f")
            default:
            break
            
        }
        
        
        updateImage()
        
    }
    @IBAction func changedValue(sender: AnyObject) {
        switch sender as! UISwitch {
            case sex:
                 NSUserDefaults.standardUserDefaults().setObject(sex.on, forKey: "sex")
                break;
            case hair:
                NSUserDefaults.standardUserDefaults().setObject(hair.on, forKey: "hair")
                break;
            case skin:
                NSUserDefaults.standardUserDefaults().setObject(skin.on, forKey: "skin")
                break;
            default:
                break;
        }
    }
    
    func updateImage() {
        imgMoi.image = UIImage(named: ProductsManager.sharedInstance.getMe())
    }

}

