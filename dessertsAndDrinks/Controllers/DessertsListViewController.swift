//
//  DessertsListViewController.swift
//  dessertsAndDrinks
//
//  Created by Ihonahan Buitrago on 3/21/17.
//  Copyright © 2017 Ihonahan Buitrago. All rights reserved.
//

import UIKit

class DessertsListViewController: FoodListViewController {

    override func viewDidLoad() {
        self.menu = Menu(name: "Menú Principal")
        self.foods = self.menu.desserts
        
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    

    override func tapUpButton(sender: UIButton) {
        if sender.tag >= 0 && sender.tag < self.foods.count {
            let food = self.foods[sender.tag]
            self.performSegue(withIdentifier: "showDessertDetail", sender: food)
        }
    }
    
}
