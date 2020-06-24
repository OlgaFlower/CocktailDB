//
//  DrinksFilterPresenter.swift
//  Cocktail DB
//
//  Created by Olha Bereziuk on 22.06.2020.
//  Copyright © 2020 Olha Bereziuk. All rights reserved.
//

import UIKit

class DrinksFilterPresenter {
    
    var drinksGroup: DrinksGroup?
    
    //Load all drinks categories
    func loadCocktailGroup(completion: @escaping (DrinksGroup) -> Void) {
        NetworkManager.shared.fetchDrinksGroup { [weak self] group in
            self?.drinksGroup = group
            completion(group)
        }
    }
}
