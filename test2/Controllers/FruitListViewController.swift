//
//  ViewController.swift
//  test2
//
//  Created by duytran on 9/22/21.
//

import UIKit

class FruitListViewController: UIViewController {

    
    @IBOutlet weak var fruitCollectionView: UICollectionView!
    
    var fruitsData = [Fruit]()
    weak var fruitDelegate:FruitDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fruitCollectionView.dataSource = self
        fruitCollectionView.delegate = self
        let nibCell = UINib(nibName: "FruitCollectionViewCell", bundle: nil)
        fruitCollectionView.register(nibCell, forCellWithReuseIdentifier: "FruitCell")
        fruitsData = createListFruit()
        
    }
    func createListFruit() -> [Fruit] {
        return [Fruit(name: "Australian Cherry",
                      imageName: "mae-mu-vbAEHCrvXZ0-unsplash",
                      description: "Australian Cherries are produced in six states, with New South Wales, Victoria and Tasmania being the three largest producers and South Australia the fourth largest producer.",
                      unit: "Price per kg",
                      price: 7.2,
                      protomationalPrice: 5.6,
                      isFavor: false, rating: 3.5, ratingCout: 49, status: .FreeShip("Free Ship")),
                Fruit(name: "Fresh Orange",
                      imageName: "mae-mu-8Vh6ulKc50o-unsplash",
                      description: "Oranges are round, orange-colored citrus fruits that grow on trees. They originally came from China, but today these nutritious powerhouses are grown in warm climates around the world.",
                      unit: "Price per kg",
                      price: 6.8,
                      protomationalPrice: 6.2,
                      isFavor: false, rating: 4.5, ratingCout: 59, status: .Empty),
                Fruit(name: "Banana (5 items)",
                      imageName: "giorgio-trovato-fczCr7MdE7U-unsplash",
                      description: "One serving, or one medium ripe banana, provides about 110 calories, 0 gram fat, 1 gram protein, 28 grams carbohydrate, 15 grams sugar (naturally occurring), 3 grams fiber, and 450 mg potassium.",
                      unit: "Price per kg",
                      price: 4.6,
                      protomationalPrice: 3.2,
                      isFavor: false, rating: 4.7, ratingCout: 72, status: .Empty),
                Fruit(name: "Blue Strawberry",
                      imageName: "katherine-chase-0DtoVEDaJbs-unsplash",
                      description: "Strawberries are very rich in antioxidants and plant compounds, which may have benefits for heart health and blood sugar control",
                      unit: "Price per kg",
                      price: 7.0,
                      protomationalPrice: 6.6,
                      isFavor: false, rating: 3.3, ratingCout: 25, status: .Empty),
                Fruit(name: "Papaya",
                      imageName: "charles-deluvio-yPI38imbQSI-unsplash",
                      description: "Carica papaya is the scientific name of the orange and green fruit known more commonly as papaya. It tastes sweet and has a soft texture that many find appealing. The seeds are also edible, although they’re more bitter than the fruit itself.",
                      unit: "Price per kg",
                      price: 5.4,
                      protomationalPrice: 4.8,
                      isFavor: false, rating: 4.3, ratingCout: 26, status: .Empty),
                Fruit(name: "Tangerine",
                      imageName: "mae-mu-U1iYwZ8Dx7k-unsplash",
                      description: "Having healthy levels of vitamin C in your body has been tied to having healthy skin. Vitamin C has been shown to play a vital role in how your body makes collagen. Collagen is what makes our skin appear youthful. Vitamin C has also been shown to possibly prevent and treat skin damage caused by sun exposure.v",
                      unit: "Price per kg",
                      price: 3.5,
                      protomationalPrice: 3.2,
                      isFavor: false, rating: 4.8, ratingCout: 54, status: .Sale("Sale 12%"))]
    }
  
}
extension FruitListViewController : UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 170, height: 210)
    }

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        
        let sb = UIStoryboard(name: "Main", bundle: nil)
        let vc = sb.instantiateViewController(identifier: "DetailFruitViewController") as! DetailFruitViewController
        vc.fruit = fruitsData[indexPath.row]
        //self.fruitDelegate = vc
        //fruitDelegate?.sendFruitData(with: fruitsData[indexPath.row])
        self.navigationController?.pushViewController(vc, animated: true)
        
        
    }
    
}
extension FruitListViewController : UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return fruitsData.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "FruitCell", for: indexPath) as! FruitCollectionViewCell
        let fruitItem = fruitsData[indexPath.row]
        cell.fruit = fruitItem
        cell.layer.cornerRadius = 10
        if let isFavor = UserDefaults.standard.value(forKey: fruitItem.name) as? Bool {
            if isFavor {
                cell.favorButton.setImage(UIImage(systemName: "suit.heart.fill")?.withTintColor(.systemRed, renderingMode: .alwaysOriginal), for: .normal)
            } else {
                cell.favorButton.setImage(UIImage(systemName: "suit.heart")?.withTintColor(.white, renderingMode: .alwaysOriginal), for: .normal)
            }
        }
        
        cell.fruitDelegate = self
        return cell
    }
    
    
}
extension FruitListViewController : FruitDelegate {
    func sendFruitData(with fruit: Fruit) {
        
        UserDefaults.standard.setValue(fruit.isFavor, forKey: fruit.name)
    }
    
    
}


