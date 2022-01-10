//
//  Character.swift
//  Character App
//
//  Created by Yok on 6/1/2565 BE.
//

import Foundation

struct CharacterResponse: Decodable {
    let results: [Character]
}

struct Character : Decodable {
    let id: Int
    let name: String
    let status : String
    let species : String
    let gender : String
    let image : String
    let created : String
    
}
