//
//  DrinksVC + HandleFilters.swift
//  Cocktail DB
//
//  Created by Olha Bereziuk on 22.06.2020.
//  Copyright © 2020 Olha Bereziuk. All rights reserved.
//

import Foundation

extension DrinksViewController {
    
    func displayDrinks() {
        cleanAllDrinksArr()
        restoreSelectedCategories()
        if !restoredCategories.isEmpty {
            loadCategoryDrinks()
        } else {
            tableView.reloadData()
            return
            
        }
    }
    
    func cleanAllDrinksArr() {
        presenter.allDrinksToDisplay.removeAll()
    }
    
    func restoreSelectedCategories() {
        let categories = self.defaults.object(forKey: "selectedCategories") as? [String] ?? [String]()
        self.restoredCategories = categories.sorted()
    }
    
    func loadCategoryDrinks() {
        presenter.loadDrinks("Cocktail") { [weak self] drinks in
            DispatchQueue.main.async {
                self?.tableView.reloadData()
            }
        }
    }
    

}
