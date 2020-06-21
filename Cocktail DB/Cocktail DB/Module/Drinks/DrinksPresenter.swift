//
//  CocktailsListPresenter.swift
//  Cocktail DB
//
//  Created by Olha Bereziuk on 21.06.2020.
//  Copyright © 2020 Olha Bereziuk. All rights reserved.
//

import Foundation

class DrinksPresenter {
    
    var drinksList: Drinks?
    
    func loadDrinks(_ category: String, completion: @escaping (Drinks) -> Void) {
        NetworkManager.shared.fetchDrinksByCategory(category) { [weak self] drinks in
            self?.drinksList = drinks
//            print(drinks)
            completion(drinks)
        }
    }

}
