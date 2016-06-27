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
    private var actualProduct:Product!
    
    //FILTER ACTIF ?
    var hair:Bool
    var skin:Bool
    var sex:Bool
    
    //FILTER ME
    var hair_b:Bool
    var hair_d:Bool
    var skin_b:Bool
    var skin_d:Bool
    var sex_m:Bool
    var sex_f:Bool
    
    
    //FILTER MOOD
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
        
        hair_b = false
        hair_d = false
        skin_b = false
        skin_d = false
        sex_m = false
        sex_f = false
        
        work = false
        we = false
        party = false
        chill = false
    }
    
    func setProducts(ps:[Product]) {
        self.products = ps
    }
    
    func getFilteredProducts() -> [Product] {
        return self.filter10Products
    }
    
    func getProducts() -> [Product] {
        return self.products
    }
    
    func getActualProduct() -> Product {
        return self.actualProduct
    }
    
    func setActualProduct(id:Int) {
        self.actualProduct = self.filter10Products[id]
    }
    
    func shake(){
        self.filter10Products = [Product]()
        if (self.filterProducts.count > 0) {
            self.filter10ProductsLeft.shuffle()
            for _ in 1...10 {
                if (self.filter10ProductsLeft.count == 0) {
                    self.filter10ProductsLeft = self.filterProducts
                    self.filter10ProductsLeft.shuffle()
                }
                self.filter10Products.append(self.filter10ProductsLeft.first!)
                self.filter10ProductsLeft.removeFirst()
            }
        }
    }
    
    
    func setMe(hair:Bool, skin:Bool, sex:Bool) {
        self.hair = hair
        self.skin = skin
        self.sex = sex
    }
    
    func setSex(male:Bool, female:Bool) {
        self.sex_f = female
        self.sex_m = male
    }
    
    func setSkin(bright:Bool, dark:Bool) {
        self.skin_d = dark
        self.skin_b = bright
    }
    
    func setHair(bright:Bool, dark:Bool) {
        self.hair_d = dark
        self.hair_b = bright
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
        if (!isCorrectHair(p)) {
            return false
        }
        if (!isCorrectSkin(p)) {
            return false
        }
        if (!isCorrectSex(p)) {
            return false
        }
        return true
    }
    func isCorrectSkin(p:Product) -> Bool {
        if (self.skin) {
            if (self.skin_b){
                if (p.skin!.isBright()) {
                    return true
                }
            }
            if (self.skin_d) {
                if (p.skin!.isDark()) {
                    return true
                }
            }
        } else {
            return true
        }
        return false
    }
    func isCorrectHair(p:Product) -> Bool {
        if (self.hair) {
            if (self.hair_b){
                if (p.hair!.isBright()) {
                    return true
                }
            }
            if (self.hair_d) {
                if (p.hair!.isDark()) {
                    return true
                }
            }
        } else {
            return true
        }
        return false
    }
    func isCorrectSex(p:Product) -> Bool {
        if (self.sex) {
            if (self.sex_m){
                if (p.gender!.isMale()) {
                    return true
                }
            }
            if (self.sex_f) {
                if (p.gender!.isFemale()) {
                    return true
                }
            }
        } else {
            return true
        }
        return false
    }
    
    func getMe() -> String {
        if (self.sex_f) {
            if (self.skin_b) {
                if (self.hair_b) {
                    return "blanche_bl"
                } else {
                    return "blanche_br"
                }
            } else {
                if (self.hair_b) {
                    return "noire_bl"
                } else {
                    return "noire_br"
                }
            }
        } else {
            if (self.skin_b) {
                if (self.hair_b) {
                    return "blanc_bl"
                } else {
                    return "blanc_br"
                }
            } else {
                if (self.hair_b) {
                    return "noir_bl"
                } else {
                    return "noir_br"
                }
            }
        }
    }
    
    func isCorrectMood(p:Product) -> Bool{
        
        if (self.work) {
            if (p.mood!.work) {
                return true
            }
        }
        
        if (self.chill) {
            if (p.mood!.chill) {
                return true
            }
        }
        
        if (self.party) {
            if (p.mood!.party) {
                return true
            }
        }
        
        if (self.we) {
            if (p.mood!.weekend) {
                return true
            }
        }
        
        return false
    }
    
}