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
        removeAllDrinksFromArr()
        restoreSelectedCategories()
        if !restoredCategories.isEmpty {
            guard let firstCategoryToLoad = restoredCategories.first! else { return }
            restoredCategories.removeFirst()
            loadCategoryDrinks(firstCategoryToLoad)
        }
        else {
//            DispatchQueue.main.async {
                self.tableView.reloadData()
//            }
            
            return
            
        }
    }
    
    func removeAllDrinksFromArr() {
        presenter.allDrinksToDisplay.removeAll()
    }
    
    func restoreSelectedCategories() {
        let categories = self.defaults.object(forKey: "selectedCategories") as? [String] ?? [String]()
        self.restoredCategories = categories.sorted()
        self.categoryTitles = restoredCategories
    }
    
    func loadCategoryDrinks(_ category: String) {
        presenter.loadDrinks(category) { [weak self] drinks in
            DispatchQueue.main.async {
            self?.tableView.reloadData()
            }
        }
    }
    

}
