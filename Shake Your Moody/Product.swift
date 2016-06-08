//
//  Product.swift
//  Shake Your Moody
//
//  Created by Robin PAUQUET on 07/06/2016.
//  Copyright © 2016 Robin PAUQUET. All rights reserved.
//

import Foundation

class Product {
    
    init() {
        mood = Mood()
        hair = DarkBright()
        skin = DarkBright()
        gender = Gender()
    }
    
    var title:String = ""
    var id:String = ""
    var about:String = ""
    var picture:String = ""
    var thumbnail:String = ""
    var mood:Mood?
    var gender:Gender?
    var hair:DarkBright?
    var skin:DarkBright?
    var tags:[String] = []
}

class Mood {
    var party:Bool = false
    var weekend:Bool = false
    var chill:Bool = false
    var work:Bool = false

    func isParty() -> Bool {
        return party
    }
    func isWE() -> Bool {
        return weekend
    }
    func isChill() -> Bool {
        return chill
    }
    func isWork() -> Bool {
        return work
    }
}

class Gender {
    var male:Bool = false
    var female:Bool = false
    
    func isMale() -> Bool {
        return male
    }
    func isFemale() -> Bool {
        return female
    }
}

struct DarkBright {
    var dark:Bool = false
    var bright:Bool = false
    
    func isDark() -> Bool {
        return dark
    }
    func isBright() -> Bool {
        return bright
    }
}
