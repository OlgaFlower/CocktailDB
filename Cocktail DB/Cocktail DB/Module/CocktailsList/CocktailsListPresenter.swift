//
//  CocktailsListPresenter.swift
//  Cocktail DB
//
//  Created by Olha Bereziuk on 21.06.2020.
//  Copyright © 2020 Olha Bereziuk. All rights reserved.
//

import Foundation

class CoctailsListPresenter {
    
    var cocktailGroup: CocktailGroup?
    
    func loadCocktailGroup(completion: @escaping (CocktailGroup) -> Void) {
        NetworkManager.shared.fetchCocktailCategories { [weak self] group in
            self?.cocktailGroup = group
            completion(group)
        }
    }

}
