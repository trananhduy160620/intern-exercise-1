//
//  ViewController.swift
//  test2
//
//  Created by duytran on 9/22/21.
//

import UIKit

class FruitListViewController: UIViewController {

    
    @IBOutlet weak var fruitCollectionView: UICollectionView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fruitCollectionView.dataSource = self
        fruitCollectionView.delegate = self
        let nibCell = UINib(nibName: "FruitCollectionViewCell", bundle: nil)
        fruitCollectionView.register(nibCell, forCellWithReuseIdentifier: "FruitCell")
    }


}
extension FruitListViewController : UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 170, height: 210)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("didSelectItemAt indexPath")
    }
    
}
extension FruitListViewController : UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "FruitCell", for: indexPath) as! FruitCollectionViewCell
        cell.layer.cornerRadius = 10
        return cell
    }
    
    
}

