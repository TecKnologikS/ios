//
//  ViewController.swift
//  Shake Your Moody
//
//  Created by Robin PAUQUET on 07/06/2016.
//  Copyright © 2016 Robin PAUQUET. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

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
    /*
    func getJSON(urlToRequest: String) -> NSData{
        return NSData(contentsOfURL: NSURL(string: urlToRequest)!)!
    }
    
    static func convert(src: NSString) -> NSDictionary {
        // convert String to NSData
        let data = src.dataUsingEncoding(NSUTF8StringEncoding)
        var error: NSError?
        
        // convert NSData to 'AnyObject'
        let anyObj: AnyObject?
        do {
            anyObj = try NSJSONSerialization.JSONObjectWithData(data!, options: NSJSONReadingOptions(rawValue: 0))
        } catch let error1 as NSError {
            error = error1
            anyObj = nil
        }
        
        if(error != nil) {
            // If there is an error parsing JSON, print it to the console
            print("JSON Error \(error!.localizedDescription)")
            //self.showError()
            return NSDictionary()
        } else {
            
            return anyObj as! NSDictionary
        }
        
    }
    
    func jsonToData(data:NSData) -> [Product] {
        var products = [Product]()
        do {
            if let JSONObject = try NSJSONSerialization.JSONObjectWithData(data, options: .AllowFragments) as? [[String: AnyObject]] {
                for p in JSONObject {
                    var product:Product!
                    product.about = p["about"]!.variable
                    products.append(product)
                }
                // There's our username
            }
        } catch {
            print("error serializing JSON: \(error)")
        }
        return products
    }*/



}

