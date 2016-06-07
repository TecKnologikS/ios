//
//  Parser.swift
//  Shake Your Moody
//
//  Created by Robin PAUQUET on 07/06/2016.
//  Copyright © 2016 Robin PAUQUET. All rights reserved.
//

import Foundation

class Parser {
    func getJSON(urlToRequest: String) -> NSData{
        return NSData(contentsOfURL: NSURL(string: urlToRequest)!)!
    }
    
    func jsonTODATA2(data:NSData) {
        var products = [Product]()
        do {
            let jsonResult = try NSJSONSerialization.JSONObjectWithData(data, options: NSJSONReadingOptions.MutableContainers)
            for anItem in jsonResult as! [Dictionary<String, AnyObject>] {
                var p = Product()
                p.about = anItem["about"] as! String
                p.title = anItem["title"] as! String
                //let personID = anItem["id"] as! Int
                products.append(p)
                // do something with personName and personID
            }
        } catch let error as NSError {
            print(error)
        }
        for p in products {
            print("coucou")
        }
    }

}