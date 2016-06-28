//
//  WebController.swift
//  Shake Your Moody
//
//  Created by Robin PAUQUET on 10/06/2016.
//  Copyright © 2016 Robin PAUQUET. All rights reserved.
//

import UIKit
class WebController: UIViewController {
    
    @IBOutlet weak var webView: UIWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let urls = "https://www.google.fr/webhp?&ie=UTF-8#q=\(ProductsManager.sharedInstance.getActualProduct().title.stringByReplacingOccurrencesOfString(" ", withString: "+"))&tbm=shop"
        let url = NSURL (string: urls);
        let requestObj = NSURLRequest(URL: url!);
        webView.loadRequest(requestObj);
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
}