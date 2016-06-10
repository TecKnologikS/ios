//
//  MoodController.swift
//  Shake Your Moody
//
//  Created by Robin PAUQUET on 08/06/2016.
//  Copyright © 2016 Robin PAUQUET. All rights reserved.
//


import UIKit

class MoodController: UIViewController {
    
    @IBOutlet weak var work: UISwitch!
    @IBOutlet weak var party: UISwitch!
    @IBOutlet weak var we: UISwitch!
    @IBOutlet weak var chill: UISwitch!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //var products:[Product] = jsonToData(getJSON("http://163.172.27.134/api/products"))
        //test
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        Next()
        ProductsManager.sharedInstance.filter()
        ProductsManager.sharedInstance.shake()
    }
    
    func Next() {
        ProductsManager.sharedInstance.setMood(work.on, we: we.on, party: party.on, chill: chill.on)
    }

}