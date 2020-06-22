//
//  DrinksVC + HandleFilters.swift
//  Cocktail DB
//
//  Created by Olha Bereziuk on 22.06.2020.
//  Copyright © 2020 Olha Bereziuk. All rights reserved.
//

import Foundation

extension DrinksViewController {
    
    func restoreSelectedCategories() {
        restoredCategories = defaults.object(forKey: "selectedCategories") as? [String] ?? [String]()
    }
    
    func loadCategoryDrinks() {
//        guard let category = restoredCategories.first! else { return }
        presenter.loadDrinks("Cocktail") { [weak self] drinks in
            DispatchQueue.main.async {
                self?.tableView.reloadData()
            }
        }
    }
    

}
