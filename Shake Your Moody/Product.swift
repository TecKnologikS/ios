//
//  Product.swift
//  Shake Your Moody
//
//  Created by Robin PAUQUET on 07/06/2016.
//  Copyright © 2016 Robin PAUQUET. All rights reserved.
//

import Foundation

class Product {
    var title:String = ""
    var id:String = ""
    var about:String = ""
    var picture:String = ""
    var thumbnail:String = ""
    var mood:Mood?
    var gender:Gender?
    var hair:Hair?
    var skin:Skin?
    var tags:[String] = []
}

class Mood {
    var party:Bool = false
    var weekend:Bool = false
    var chill:Bool = false
    var work:Bool = false
}

class Gender {
    var male:Bool = false
    var female:Bool = false
}

class Hair {
    var dark:Bool = false
    var bright:Bool = false
}

class Skin {
    var dark:Bool = false
    var bright:Bool = false
}