//
//  ProductsManager.swift
//  Shake Your Moody
//
//  Created by Robin PAUQUET on 08/06/2016.
//  Copyright © 2016 Robin PAUQUET. All rights reserved.
//

import Foundation

class ProductsManager {
    static let sharedInstance = ProductsManager()
    private var products = [Product]()
    private var filterProducts = [Product]()
    private var filter10Products = [Product]()
    private var filter10ProductsLeft = [Product]()
    var hair:Bool
    var skin:Bool
    var sex:Bool
    var work:Bool
    var we:Bool
    var party:Bool
    var chill:Bool
    let BRIGHT = false
    let DARK = true
    let FEMALE = true
    let MALE = false
    
    
    init() {
        hair = false
        skin = false
        sex = false
        work = false
        we = false
        party = false
        chill = false
    }
    
    func setProducts(ps:[Product]) {
        self.products = ps
    }
    
    func get10FilteredProducts() -> [Product]{
        self.filter10Products = [Product]()
        if (self.filter10ProductsLeft.count > 0) {
            self.filter10ProductsLeft.shuffle()
            for _ in 1...10 {
                if (self.filter10ProductsLeft.count == 0) {
                    break
                }
                self.filter10Products.append(self.filter10ProductsLeft.first!)
                self.filter10ProductsLeft.removeFirst()
            }
        }
        return filter10Products
    }
    
    func getFilteredProducts() -> [Product]{
        return filterProducts
    }
    
    func setMe(hair:Bool, skin:Bool, sex:Bool) {
        self.hair = hair
        self.skin = skin
        self.sex = sex
    }
    
    func setMood(work:Bool, we:Bool, party:Bool, chill:Bool) {
        self.work = work
        self.we = we
        self.party = party
        self.chill = chill
    }
    
    func filter() {
        for p in products {
            if isCorrectMe(p) && isCorrectMood(p){
                filterProducts.append(p)
                filter10ProductsLeft.append(p)
            }
        }
    }
    
    func isCorrectMe(p:Product) -> Bool {
        if (self.hair) {
            //BRIGHT
            if (p.hair!.isDark()) {
                return false;
            }
        } else {
            //DARK
            if (p.hair!.isBright()) {
                return false;
            }
        }
        
        if (self.skin) {
            //BRIGHT
            if (p.skin!.isDark()) {
                return false;
            }
        } else {
            //DARK
            if (p.skin!.isBright()) {
                return false;
            }
        }
        
        if (self.sex) {
            //FEMALE
            if (p.gender!.isMale()) {
                return false;
            }
        } else {
            //MALE
            if (p.gender!.isFemale()) {
                return false;
            }
        }
        
        return true
    }
    
    func isCorrectMood(p:Product) -> Bool{
        
        if (p.mood?.work != self.work) {
            return false
        }
        
        if (p.mood?.chill != self.chill) {
            return false
        }
        
        if (p.mood?.party != self.party) {
            return false
        }
        
        if (p.mood?.weekend != self.we) {
            return false
        }
        
        return true
    }
    
}