//
//  CharacterCollectionViewController.swift
//  Characters
//
//  Created by Yok on 10/1/2565 BE.
//

import UIKit
import Kingfisher
private let reuseIdentifier = "CharacterCell"


class CharacterCollectionViewController: UICollectionViewController {

    
    private var contentVM = ContentViewViewModel()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        self.collectionView.register(UINib(nibName: reuseIdentifier, bundle: nil), forCellWithReuseIdentifier: reuseIdentifier)
       
            self.collectionView.delegate = self
            self.collectionView.dataSource = self
        self.contentVM.fetchOrders { r in
            self.loadData()
        }


    }
    
   

    func loadData() {
        
        print("Count",contentVM.getCount())
        DispatchQueue.main.async {
        self.collectionView.reloadData()
        }
        
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {

        switch segue.identifier {
        case "detailSegue":
            if let vc = segue.destination as? DetailCharacterViewController{
                
                vc.character = sender as! Character
                
            }

        default:break
        }
    }
 
 
        override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    
            return contentVM.characters.count
    
    
        }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {

        let itemsPerRow: CGFloat = 2

            let collectionViewWidth: CGFloat = collectionView.frame.width

            let widthPerItem : CGFloat = collectionViewWidth / itemsPerRow

            return CGSize(width: widthPerItem - 20 , height: widthPerItem - 20)


}

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! CharacterCell

        let url = URL(string: contentVM.characters[indexPath.row].image)!
 
        cell.characterimageView.kf.setImage(with: url)
  
        cell.layer.cornerRadius = 10
        
        cell.clipsToBounds = true

        // Configure the cell

        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        self.performSegue(withIdentifier: "detailSegue", sender: contentVM.characters[indexPath.row].character)
       
    }



}


extension UIImageView {
    func load(urlString : String) {
        guard let url = URL(string: urlString)else {
            return
        }
        DispatchQueue.global().async { [weak self] in
            if let data = try? Data(contentsOf: url) {
                if let image = UIImage(data: data) {
                    DispatchQueue.main.async {
                        self?.image = image
                    }
                }
            }
        }
    }
}
