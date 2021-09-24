//
//  FruitCollectionViewCell.swift
//  test2
//
//  Created by duytran on 9/22/21.
//

import UIKit

class FruitCollectionViewCell: UICollectionViewCell {

    
    @IBOutlet weak var fruitImageView: UIImageView!
    @IBOutlet weak var fruitNameLabel: UILabel!
    @IBOutlet weak var unitLabel: UILabel!
    @IBOutlet weak var promotionalPriceLabel: UILabel!
    @IBOutlet weak var oldPriceLabel: UILabel!
    @IBOutlet weak var cartButton: UIButton!
    @IBOutlet weak var favorButton: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        cartButton.setImage(UIImage(systemName: "cart")?.withTintColor(.white, renderingMode: .alwaysOriginal), for: .normal)
        favorButton.setImage(UIImage(systemName: "suit.heart")?.withTintColor(.white, renderingMode: .alwaysOriginal), for: .normal)
    }
    
    
    @IBAction func cartButtonClick(_ sender: UIButton) {
        print("cartButtonClick")
    }
    
    @IBAction func favorButtonClick(_ sender: UIButton) {
        print("favorButtonClick")
    }
}
