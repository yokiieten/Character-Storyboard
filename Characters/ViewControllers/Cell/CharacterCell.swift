//
//  CharacterCell.swift
//  Characters
//
//  Created by Yok on 10/1/2565 BE.
//

import UIKit

class CharacterCell: UICollectionViewCell {

    @IBOutlet weak var characterimageView: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func setImage(from url: String) {
        guard let imageURL = URL(string: url) else { return }

            // just not to cause a deadlock in UI!
        DispatchQueue.global().async {
            guard let imageData = try? Data(contentsOf: imageURL) else { return }

            let image = UIImage(data: imageData)
            DispatchQueue.main.async {
                self.characterimageView.image = image
            }
        }
    }

}
