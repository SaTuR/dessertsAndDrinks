//
//  ButtonsScroller.swift
//  dessertsAndDrinks
//
//  Created by Ihonahan Buitrago on 3/21/17.
//  Copyright © 2017 Ihonahan Buitrago. All rights reserved.
//

import UIKit

class ButtonsScroller: UIView {

    @IBOutlet weak var fullContainer : UIView!
    @IBOutlet weak var scroller : UIScrollView!
    @IBOutlet weak var scrollerContent : UIView!
    @IBOutlet weak var heightScrollerContent : NSLayoutConstraint!
    
    
    var buttonsArray : [ItemButton] = []
    var foods : [Food] = []
    weak var parentView : UIViewController?
    
    
    class func loadFromNib(with foods: [Food], buttonPressed: Selector, parent: UIViewController) -> ButtonsScroller {
        var nibs = Bundle.main.loadNibNamed("ButtonsScroller", owner: self, options: nil)
        let view = nibs?[0] as! ButtonsScroller
        
        view.setupView(foods: foods, buttonPressed: buttonPressed, parent: parent)
        
        return view
    }
    
    
    func setupView(foods: [Food], buttonPressed: Selector, parent: UIViewController) {
        self.foods = foods
        self.parentView = parent
        let height : CGFloat = 70
        
        var y : CGFloat = 8.0
        
        for i in 0..<self.foods.count {
            let food = self.foods[i]
            let itemButton = ItemButton.loadFromNib(with: food, buttonPressed: buttonPressed, itemIndex: i, parent: parent)
            
            itemButton.translatesAutoresizingMaskIntoConstraints = false
            
            self.scrollerContent.addSubview(itemButton)
            
            var constraints = NSLayoutConstraint.constraints(withVisualFormat: "H:|-8-[item]-8-|",
                                                             options: NSLayoutFormatOptions.alignAllCenterX,
                                                             metrics: nil,
                                                             views: ["item":itemButton])
            
            var previousView : UIView
            var attribute : NSLayoutAttribute
            if i == 0 {
                previousView = self.scrollerContent
                attribute = .top
            } else {
                previousView = self.buttonsArray[i - 1]
                attribute = .bottom
            }
            
            let top = NSLayoutConstraint(item: itemButton,
                                         attribute: .top,
                                         relatedBy: .equal,
                                         toItem: previousView,
                                         attribute: attribute,
                                         multiplier: 1.0,
                                         constant: 8)
            let height = NSLayoutConstraint(item: itemButton,
                                            attribute: .height,
                                            relatedBy: .equal,
                                            toItem: nil,
                                            attribute: .notAnAttribute,
                                            multiplier: 1.0,
                                            constant: height)
            constraints.append(top)
            constraints.append(height)
            self.scrollerContent.addConstraints(constraints)
            self.scrollerContent.layoutSubviews()
            itemButton.translatesAutoresizingMaskIntoConstraints = true
            self.buttonsArray.append(itemButton)

            y += itemButton.frame.size.height + 8.0
        }
        
        if let button = self.buttonsArray.last {
            self.heightScrollerContent.constant = (button.frame.origin.y + button.frame.size.height + 8.0)
            self.scroller.layoutSubviews()
        }
    }

}
