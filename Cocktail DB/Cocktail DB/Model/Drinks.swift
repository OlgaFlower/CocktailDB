//
//  Drinks.swift
//  Cocktail DB
//
//  Created by Olha Bereziuk on 22.06.2020.
//  Copyright © 2020 Olha Bereziuk. All rights reserved.
//

import Foundation

//Drinks' list of the specific category
struct Drinks: Codable {
    var drinks: [DrinkDescription]?
}

struct DrinkDescription: Codable {
    var name: String?
    var imageURL: String?
    
    private enum CodingKeys: String, CodingKey {
        case name = "strDrink"
        case imageURL = "strDrinkThumb"
    }
}
