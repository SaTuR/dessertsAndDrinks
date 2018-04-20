//
//  Menu.swift
//  dessertsAndDrinks
//
//  Created by Ihonahan Buitrago on 3/6/17.
//  Copyright © 2017 Ihonahan Buitrago. All rights reserved.
//

import UIKit

class Menu {
    var name : String
    var drinks : [Drink]
    var desserts : [Dessert]
    
    init(name: String, drinks: [Drink], desserts: [Dessert]) {
        self.name = name
        self.drinks = drinks
        self.desserts = desserts
    }
    
    convenience init(name: String) {
        var drinks = [Drink]()
        for drink in DataSource.drinks {
            let item = Drink(name: drink["name"]! as! String,
                             ingredients: drink["ingredients"] as! [String : String],
                             hotBeverage: drink["hotBeverage"] as! Bool,
                             photos: drink["photos"] as! [String])
            drinks.append(item)
        }
        
        var desserts = [Dessert]()
        for dessert in DataSource.desserts {
            let item = Dessert(name: dessert["name"] as! String,
                               calories: dessert["calories"] as! Double,
                               ingredients: dessert["ingredients"] as! [String:String],
                               photos: dessert["photos"] as! [String])
            desserts.append(item)
        }

        self.init(name: name, drinks: drinks, desserts: desserts)
    }
    
}
