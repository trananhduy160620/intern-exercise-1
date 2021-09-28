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
                      isFavor: false, rating: 5, ratingCout: 50, status: .FreeShip("Free Ship")),
                Fruit(name: "Fresh Orange",
                      imageName: "mae-mu-8Vh6ulKc50o-unsplash",
                      description: "Oranges are round, orange-colored citrus fruits that grow on trees. They originally came from China, but today these nutritious powerhouses are grown in warm climates around the world.",
                      unit: "Price per kg",
                      price: 6.8,
                      protomationalPrice: 6.2,
                      isFavor: false, rating: 5, ratingCout: 50, status: .Empty),
                Fruit(name: "Banana (5 items)",
                      imageName: "giorgio-trovato-fczCr7MdE7U-unsplash",
                      description: "One serving, or one medium ripe banana, provides about 110 calories, 0 gram fat, 1 gram protein, 28 grams carbohydrate, 15 grams sugar (naturally occurring), 3 grams fiber, and 450 mg potassium.",
                      unit: "Price per kg",
                      price: 4.6,
                      protomationalPrice: 3.2,
                      isFavor: false, rating: 5, ratingCout: 50, status: .Empty),
                Fruit(name: "Blue Strawberry",
                      imageName: "katherine-chase-0DtoVEDaJbs-unsplash",
                      description: "Strawberries are very rich in antioxidants and plant compounds, which may have benefits for heart health and blood sugar control",
                      unit: "Price per kg",
                      price: 7.0,
                      protomationalPrice: 6.6,
                      isFavor: false, rating: 5, ratingCout: 50, status: .Empty),
                Fruit(name: "Papaya",
                      imageName: "charles-deluvio-yPI38imbQSI-unsplash",
                      description: "Carica papaya is the scientific name of the orange and green fruit known more commonly as papaya. It tastes sweet and has a soft texture that many find appealing. The seeds are also edible, although they’re more bitter than the fruit itself.",
                      unit: "Price per kg",
                      price: 5.4,
                      protomationalPrice: 4.8,
                      isFavor: false, rating: 5, ratingCout: 50, status: .Empty),
                Fruit(name: "Tangerine",
                      imageName: "mae-mu-U1iYwZ8Dx7k-unsplash",
                      description: "Having healthy levels of vitamin C in your body has been tied to having healthy skin. Vitamin C has been shown to play a vital role in how your body makes collagen. Collagen is what makes our skin appear youthful. Vitamin C has also been shown to possibly prevent and treat skin damage caused by sun exposure.v",
                      unit: "Price per kg",
                      price: 3.5,
                      protomationalPrice: 3.2,
                      isFavor: false, rating: 5, ratingCout: 50, status: .Sale("Sale 12%"))]
    }

}
extension FruitListViewController : UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 170, height: 210)
    }

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let fruit = fruitsData[indexPath.row]
        let data = ["Data":["FruitItem": fruit]]
        NotificationCenter.default.post(name: .fruitData, object: nil, userInfo: data)
        let sb = UIStoryboard(name: "Main", bundle: nil)
        let vc = sb.instantiateViewController(identifier: "DetailFruitViewController") as! DetailFruitViewController
        
        self.navigationController?.pushViewController(vc, animated: true)
        
        
    }
    
}
extension FruitListViewController : UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return fruitsData.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "FruitCell", for: indexPath) as! FruitCollectionViewCell
        cell.fruit = fruitsData[indexPath.row]
        cell.layer.cornerRadius = 10
        return cell
    }
    
    
}
extension Notification.Name {
    static var fruitData : Notification.Name {
        return .init("FruitData")
    }
}

