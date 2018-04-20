//
//  FoodListViewController.swift
//  dessertsAndDrinks
//
//  Created by Ihonahan Buitrago on 3/21/17.
//  Copyright © 2017 Ihonahan Buitrago. All rights reserved.
//

import UIKit

class FoodListViewController: UIViewController {

    @IBOutlet weak var fullContainer : UIView!
    
    var menu : Menu!
    var foods : [Food]!
    var buttonsView : ButtonsScroller!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        self.buttonsView = ButtonsScroller.loadFromNib(with: self.foods!, buttonPressed: #selector(FoodListViewController.tapUpButton(sender:)), parent: self)
        
        self.fullContainer.addSubview(self.buttonsView)
        self.buttonsView.translatesAutoresizingMaskIntoConstraints = false
        
        var constraints = NSLayoutConstraint.constraints(withVisualFormat: "H:|-[view]-|",
                                                         options: NSLayoutFormatOptions.alignAllCenterX,
                                                         metrics: nil,
                                                         views: ["view" : self.buttonsView])
        constraints.append(contentsOf: NSLayoutConstraint.constraints(withVisualFormat: "V:|-[view]-|",
                                                                      options: NSLayoutFormatOptions.alignAllCenterX,
                                                                      metrics: nil,
                                                                      views: ["view" : self.buttonsView]))
        self.fullContainer.addConstraints(constraints)
        self.view.layoutSubviews()
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func tapUpButton(sender: UIButton) {

    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showDessertDetail" {
            if let food = sender as? Food {
                let destinationViewController = segue.destination as! DetailViewController
                destinationViewController.detailData = food
            }
        } else if segue.identifier == "showDrinkDetail" {
            if let food = sender as? Food {
                let destinationViewController = segue.destination as! DetailViewController
                destinationViewController.detailData = food
            }
        }
    }

}
