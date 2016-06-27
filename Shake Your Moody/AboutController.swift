//
//  AboutController.swift
//  Shake Your Moody
//
//  Created by Robin PAUQUET on 10/06/2016.
//  Copyright © 2016 Robin PAUQUET. All rights reserved.
//

import UIKit
class AboutController: UIViewController {

    @IBOutlet weak var version: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //First get the nsObject by defining as an optional anyObject
        let nsObject: AnyObject? = NSBundle.mainBundle().infoDictionary!["CFBundleShortVersionString"]
        
        
        version.text = "v " + (nsObject as? String)!
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

}