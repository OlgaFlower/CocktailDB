//
//  DrinksGroup.swift
//  Cocktail DB
//
//  Created by Olha Bereziuk on 21.06.2020.
//  Copyright © 2020 Olha Bereziuk. All rights reserved.
//

import Foundation

//List of drinks categories
struct DrinksGroup: Codable {
    var categoryGroup: [CocktailCategory]?
    
    private enum CodingKeys: String, CodingKey {
        case categoryGroup = "drinks"
    }
}

struct CocktailCategory: Codable {
    var category: String?
    
    private enum CodingKeys: String, CodingKey {
        case category = "strCategory"
    }
}
