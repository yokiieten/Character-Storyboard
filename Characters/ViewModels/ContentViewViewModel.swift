//
//  ContentViewViewModel.swift
//  Character App
//
//  Created by Yok on 6/1/2565 BE.
//

import Foundation


class ContentViewViewModel: ObservableObject {
    
     var characters = [CharacterViewModel]()
    
    
    func fetchOrders(completion: @escaping(String) ->  Void) {
     
        WebService().getAllCharacter { character in
            if let character = character {
                    self.characters = character.map(CharacterViewModel.init)
                
            }
            
            print("complete")
            completion("ok")
        }
    }
    
    func getCount() -> Int {
        
        return characters.count
        
    }
    
    
}


class CharacterViewModel {
    
    let id = UUID()
    
    var character: Character
    
    init(character: Character) {
        
        self.character = character
        
    }
    
    
    
    var name: String {
        return self.character.name
    }
    
    var image: String {
        return self.character.image
    }
    var status: String {
        return self.character.status
    }
    var species: String {
        return self.character.species
    }
    var gender: String {
        return self.character.gender
    }
    var created: String {
        return self.character.created
    }
 
    
    
}
