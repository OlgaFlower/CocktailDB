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
        restoreSelectedCategories()
        if !restoredCategories.isEmpty {
            loadCategoryDrinks()
        } else { return }
    }
    
    func restoreSelectedCategories() {
        let categories = defaults.object(forKey: "selectedCategories") as? [String] ?? [String]()
        self.restoredCategories = categories.sorted()
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
    
    func loadCategoryDrinks() {
        presenter.loadDrinks("Cocktail") { [weak self] drinks in
            DispatchQueue.main.async {
                self?.tableView.reloadData()
            }
        }
    }
    

}
