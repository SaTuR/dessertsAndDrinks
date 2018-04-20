//
//  DataSource.swift
//  dessertsAndDrinks
//
//  Created by Ihonahan Buitrago on 3/6/17.
//  Copyright © 2017 Ihonahan Buitrago. All rights reserved.
//

import UIKit

class DataSource {

    static let drinks = [
        ["name": "Coffee",
         "hotBeverage": true,
         "ingredients": ["water":"1 cup", "coffee":"100gr"],
         "photos": ["coffee1", "coffee2"]
         ],
        ["name": "Vanilla Milkshake",
         "hotBeverage": false,
         "ingredients": ["vanilla ice":"4 cup", "vanilla extract":"2 teaspoons", "sugar":"8 spoons", "milk":"2 cups"],
         "photos": ["vanillamilk1", "vanillamilk2"]
        ]
    ]
    
    static let desserts = [
        ["name":"milkyway cake",
         "calories": 825,
         "ingredients": ["milkyway chocolate":"8 bars", "butter":"250 gr", "sugar":"2 cups", "egg white":"4", "flour":"2.5 cups", "sodium bicarbonate": "half cup", "milk serum":"1.25 cups"],
         "photos": ["milkyway1","milkyway2"]
        ],
        ["name":"Meat patties",
         "calories": 256,
         "ingredients": ["corn flour":"4 cups", "ground beef":"500 gr", "salt":"to taste", "spices":"to taste"],
         "photos": ["patty1","patty2"]
        ]
    ]
}
