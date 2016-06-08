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
        do {
            let jsonResult = try NSJSONSerialization.JSONObjectWithData(data, options: NSJSONReadingOptions.MutableContainers)
            for anItem in jsonResult as! [Dictionary<String, AnyObject>] {
                let p = Product()
                p.about = anItem[JSON.ABOUT] as! String
                p.title = anItem[JSON.TITlE] as! String
                p.picture = anItem[JSON.PICT] as! String
                p.thumbnail = anItem[JSON.THUMB] as! String
                p.id = anItem[JSON.ID] as! String
                for tag in anItem[JSON.TAGS] as! [String] {
                    p.tags.append(tag)
                }
                let criteres = anItem[JSON.CRITERIA] as! [String : AnyObject]
                
                let hair = criteres[JSON.HAIR] as! [String:AnyObject]
                p.hair?.bright = hair[JSON.BRIGHT] as! Bool
                p.hair?.dark = hair[JSON.DARK] as! Bool
                
                let mood = criteres[JSON.MOOD] as! [String:AnyObject]
                p.mood?.chill = mood[JSON.CHILL] as! Bool
                p.mood?.party = mood[JSON.PARTY] as! Bool
                p.mood?.work = mood[JSON.WORK] as! Bool
                p.mood?.weekend = mood[JSON.WEEKEND] as! Bool
                
                let gender = criteres[JSON.GENDER] as! [String:AnyObject]
                p.gender?.male = gender[JSON.MALE] as! Bool
                p.gender?.female = gender[JSON.FEMALE] as! Bool
                
                let skin = criteres[JSON.SKIN] as! [String:AnyObject]
                p.skin?.bright = skin[JSON.BRIGHT] as! Bool
                p.skin?.dark = skin[JSON.DARK] as! Bool
                
                products.append(p)
            }
        } catch let error as NSError {
            print(error)
        }
    }

}