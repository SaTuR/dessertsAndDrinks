//
//  Dessert.swift
//  dessertsAndDrinks
//
//  Created by Ihonahan Buitrago on 3/3/17.
//  Copyright © 2017 Ihonahan Buitrago. All rights reserved.
//

import UIKit

class Dessert : Food {
    var calories : Double
    
    init(name: String, calories: Double, ingredients: [String:String], photos: [String]) {
        self.calories = calories
        super.init()
        self.name = name
        self.ingredients = ingredients
        self.photos = photos
        self.foodType = .dessert
    }
    
    convenience override init() {
        self.init(name: "", calories: 0.0, ingredients: [:], photos: [])
    }

}
