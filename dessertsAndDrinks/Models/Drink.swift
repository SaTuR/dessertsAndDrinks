//
//  Drink.swift
//  dessertsAndDrinks
//
//  Created by Ihonahan Buitrago on 3/6/17.
//  Copyright © 2017 Ihonahan Buitrago. All rights reserved.
//

import UIKit

class Drink : Food {
    var hotBeverage : Bool
    
    init(name: String, ingredients: [String:String], hotBeverage: Bool, photos: [String]) {
        self.hotBeverage = hotBeverage
        super.init()
        self.name = name
        self.ingredients = ingredients
        self.photos = photos
        self.foodType = .drink
    }
    
    convenience override init() {
        self.init(name: "", ingredients: [:], hotBeverage: false, photos: [])
    }

}
