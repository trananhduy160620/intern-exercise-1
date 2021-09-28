//
//  DetailFruitViewController.swift
//  test2
//
//  Created by duytran on 9/26/21.
//

import UIKit

class DetailFruitViewController: UIViewController {

    @IBOutlet weak var minusButton: UIButton!
    @IBOutlet weak var plusButton: UIButton!
    @IBOutlet weak var sojaButton: UIButton!
    @IBOutlet weak var senfButton: UIButton!
    @IBOutlet weak var avocadoButton: UIButton!
    @IBOutlet weak var countLabel: UILabel!
    @IBOutlet weak var fruitLabel: UILabel!
    @IBOutlet weak var fruitImageView: UIImageView!
    
    
    var count = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        customMinusButton()
        customPlusButton()
        customSojaButton()
        customSenfButton()
        customAvocadoButton()
        customFruitLabel()
        customFruiImageView()
        
        NotificationCenter.default.addObserver(self, selector: #selector(reveiceNotification(notification:)), name: .fruitData, object: nil)
        
    }
    
    
    @objc func reveiceNotification(notification: Notification) {
        if let data = notification.userInfo?["Data"] as? [String: Any] {
            if let fruit = data["FruitItem"] as? Fruit {
                fruitImageView.image = UIImage(named: fruit.imageName)
                print(fruit)
            }
        }
//        print(notification.object)
//        if let fruit = notification.object as? Fruit {
//            fruitImageView.image = UIImage(named: fruit.imageName)
//            print(fruit)
//        }
//        print(notification.userInfo)
    }
   
    func customMinusButton() {
        minusButton.layer.cornerRadius = 7
        minusButton.layer.masksToBounds = true
    }
    func customPlusButton() {
        plusButton.layer.cornerRadius = 7
        plusButton.layer.masksToBounds = true
    }
    
    func customSojaButton() {
        sojaButton.layer.cornerRadius = 20
        sojaButton.layer.masksToBounds = true
    }
    func customSenfButton() {
        senfButton.layer.cornerRadius = 20
        senfButton.layer.masksToBounds = true
    }
    func customAvocadoButton() {
        avocadoButton.layer.cornerRadius = 20
        avocadoButton.layer.masksToBounds = true
    }

    func customFruitLabel() {
        fruitLabel.layer.cornerRadius = 15
        fruitLabel.layer.masksToBounds = true
    }
    func customFruiImageView() {
        fruitImageView.layer.cornerRadius = fruitImageView.frame.height/2
        fruitImageView.layer.masksToBounds = true
    }
    
    
    @IBAction func plusButtonClick(_ sender: UIButton) {
        count += 1
        countLabel.text = "\(count)"
    }
    
    @IBAction func minusButtonClick(_ sender: UIButton) {
        count -= 1
        if count <= 0 {
            count = 0
        }
        countLabel.text = "\(count)"
    }
    
    @IBAction func sojaButtonClick(_ sender: UIButton) {
        print("sojaButtonClick")
    }
    
    @IBAction func senfButtonclick(_ sender: UIButton) {
        print("senfButtonclick")
    }
    
    
    @IBAction func avocadoButtonClick(_ sender: UIButton) {
        print("avocadoButtonClick")
    }
    
    @IBAction func paymentButtonClick(_ sender: UIButton) {
        print("paymentButtonClick")
    }
    

}


