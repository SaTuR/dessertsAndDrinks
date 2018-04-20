//
//  DetailViewController.swift
//  dessertsAndDrinks
//
//  Created by Ihonahan Buitrago on 3/16/17.
//  Copyright © 2017 Ihonahan Buitrago. All rights reserved.
//

import UIKit


class DetailViewController: UIViewController {
    
    @IBOutlet weak var fullContainer : UIView!
    @IBOutlet weak var imagesScroller : UIScrollView!
    @IBOutlet weak var nameLabel : UILabel!
    @IBOutlet weak var featureLabel : UILabel!
    @IBOutlet weak var ingredientsText : UITextView!
    
    weak var detailData : Food!
    
    var imagesAdded = false
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        if let data = self.detailData {
            self.addImagesInScroll()

            self.nameLabel.text = data.name
            
            var feature = ""
            switch self.detailData.foodType {
            case .drink:
                let drink = data as! Drink
                feature = drink.hotBeverage ? "Hot drink" : "Cold drink"
                break
            case .dessert:
                let dessert = data as! Dessert
                feature = "\(dessert.calories) calories"
                break
            }
            self.featureLabel.text = feature
            
            var ingredients = "Ingredients:\n\r"
            for key in self.detailData.ingredients.keys {
                if let value : String = self.detailData.ingredients[key] {
                    ingredients += "\(key): \(value)\n\r"
                }
            }
            self.ingredientsText.text = ingredients
        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        if !self.imagesAdded {
            self.addImagesInScroll()
            self.imagesAdded = true
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    func addImagesInScroll() {
        let width = Double(self.imagesScroller.frame.size.height * 1.25)
        var x = 0.0
        for image in self.detailData.photos {
            let imageData = UIImage(named: image)
            let rect = CGRect(x: x, y: 0.0, width: width, height: Double(self.imagesScroller.frame.size.height))
            let imageView = UIImageView(frame: rect)
            imageView.image = imageData
            imageView.contentMode = .scaleAspectFill
            self.imagesScroller.addSubview(imageView)
            x += width
        }
        
        self.imagesScroller.contentSize = CGSize(width: CGFloat(x), height: self.imagesScroller.frame.size.height)
    }


}
