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
    @IBOutlet weak var statusLabel: CustomLabel!
    @IBOutlet weak var cartButton: UIButton!
    @IBOutlet weak var favorButton: UIButton!
    var isFavor = false
    var fruit: Fruit? {
        didSet {
            fruitImageView.image = UIImage(named: fruit!.imageName)
            fruitNameLabel.text = fruit?.name
            unitLabel.text = fruit?.unit
            promotionalPriceLabel.text = "$\(fruit!.protomationalPrice)"
            oldPriceLabel.text = "$\(fruit!.price)"
            switch fruit?.status {
            case .Empty:
                statusLabel.isHidden = true
                break
            case.FreeShip(let content):
                statusLabel.text = content
                statusLabel.backgroundColor = .systemBlue
                statusLabel.textColor = .white
                break
            case .Sale(let content):
                statusLabel.text = content
                statusLabel.backgroundColor = .systemYellow
                statusLabel.textColor = .white
                break
            default:
                break
            }
            
        }
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        
        cartButton.setImage(UIImage(systemName: "cart")?.withTintColor(.white, renderingMode: .alwaysOriginal), for: .normal)
        favorButton.setImage(UIImage(systemName: "suit.heart")?.withTintColor(.white, renderingMode: .alwaysOriginal), for: .normal)
    }
    
    
    @IBAction func cartButtonClick(_ sender: UIButton) {
        
    }
    
    @IBAction func favorButtonClick(_ sender: UIButton) {
        isFavor = !isFavor
        
        if isFavor {
            favorButton.setImage(UIImage(systemName: "suit.heart.fill")?.withTintColor(.systemRed, renderingMode: .alwaysOriginal), for: .normal)
        } else {
            favorButton.setImage(UIImage(systemName: "suit.heart")?.withTintColor(.white, renderingMode: .alwaysOriginal), for: .normal)
        }
        fruit?.isFavor = isFavor
    }
}
