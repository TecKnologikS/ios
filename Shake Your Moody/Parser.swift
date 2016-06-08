//
//  Parser.swift
//  Shake Your Moody
//
//  Created by Robin PAUQUET on 07/06/2016.
//  Copyright © 2016 Robin PAUQUET. All rights reserved.
//

import Foundation

class Parser {
    
    var products:[Product]
    var url:String
    init(){
        products = [Product]()
        url = ""
    }
    init(adresse:String){
        products = [Product]()
        url = adresse
    }
    
    func setAdresse(adresse:String) {
        url = adresse
    }
    
    func getProducts() -> [Product] {
        jsonTODATA2(getJSON(url))
        return products
    }
    
    func getJSON(urlToRequest: String) -> NSData{
        return NSData(contentsOfURL: NSURL(string: urlToRequest)!)!
    }
    
    func jsonTODATA2(data:NSData) {
        var products = [Product]()
        do {
            let jsonResult = try NSJSONSerialization.JSONObjectWithData(data, options: NSJSONReadingOptions.MutableContainers)
            for anItem in jsonResult as! [Dictionary<String, AnyObject>] {
                var p = Product()
                p.about = anItem[JSON.ABOUT] as! String
                p.title = anItem[JSON.TITlE] as! String
                p.picture = anItem[JSON.PICT] as! String
                p.thumbnail = anItem[JSON.THUMB] as! String
                p.id = anItem[JSON.ID] as! String
                
                let critere = anItem[JSON.CRITERIA] as! [Dictionary<String, AnyObject>]
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