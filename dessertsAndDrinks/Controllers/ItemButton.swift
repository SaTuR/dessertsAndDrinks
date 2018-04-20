//
//  ItemButton.swift
//  dessertsAndDrinks
//
//  Created by Ihonahan Buitrago on 3/21/17.
//  Copyright © 2017 Ihonahan Buitrago. All rights reserved.
//

import UIKit

class ItemButton: UIView {

    @IBOutlet weak var fullContainer : UIView!
    @IBOutlet weak var button : UIButton!
    @IBOutlet weak var imageView : UIImageView!
    @IBOutlet weak var nameLabel : UILabel!
    
    var food : Food = Food()
    
    class func loadFromNib(with food: Food, buttonPressed: Selector, itemIndex: Int, parent: UIViewController) -> ItemButton {
        var nibs = Bundle.main.loadNibNamed("ItemButton", owner: self, options: nil)
        let view = nibs?[0] as! ItemButton
        
        view.setupView(with: food, buttonPressed: buttonPressed, itemIndex: itemIndex, parent: parent)
        
        return view
    }

    func setupView(with food: Food, buttonPressed: Selector, itemIndex: Int, parent: UIViewController) {
        self.food = food
        self.nameLabel.text = self.food.name
        
        self.button.addTarget(parent, action: buttonPressed, for: .touchUpInside)
        self.button.tag = itemIndex
        
        if self.food.photos.count > 0 {
            let imageName = self.food.photos[0]
            self.imageView.image = UIImage(named: imageName)
        }
    }
}
