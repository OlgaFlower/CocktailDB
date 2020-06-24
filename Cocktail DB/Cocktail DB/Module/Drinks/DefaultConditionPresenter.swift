//
//  DefaultCondition.swift
//  Cocktail DB
//
//  Created by Olha Bereziuk on 24.06.2020.
//  Copyright © 2020 Olha Bereziuk. All rights reserved.
//

import Foundation

class DefaultConditionPresenter {
    
    var categories = [String?]()
    let defaults = UserDefaults.standard
    
    func loadAllCategories(completion: @escaping (DrinksGroup) -> Void) {
        NetworkManager.shared.fetchDrinksGroup { [weak self] group in
            for i in 0 ..< (group.categoryGroup?.count)! {
                self?.categories.append(group.categoryGroup?[i].category)
            }
            self?.saveDefaults()
            completion(group)
        }
    }
    
    func saveDefaults() {
        defaults.set(categories, forKey: "selectedCategories")
    }
}
