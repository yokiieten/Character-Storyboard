//
//  ViewController.swift
//  Characters
//
//  Created by Yok on 10/1/2565 BE.
//

import UIKit

class DetailCharacterViewController: UIViewController {

    @IBOutlet weak var characterimageView: UIImageView!
    
    @IBOutlet weak var statusLabel: UILabel!
    
    @IBOutlet weak var genderLabel: UILabel!
    
    @IBOutlet weak var speciesLabel: UILabel!
    
    @IBOutlet weak var createdLabel: UILabel!
    
    @IBOutlet weak var nameLabel: UILabel!
    var character : Character?
    override func viewDidLoad() {
        super.viewDidLoad()
        guard let character = character else { return  }
        
        characterimageView.load(urlString: character.image)
        nameLabel.text = character.name
        statusLabel.text = character.status
        genderLabel.text = character.gender
        speciesLabel.text = character.species
        createdLabel.text = character.created
        
    }


}

