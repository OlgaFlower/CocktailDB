//
//  DrinksVC + HandleFilters.swift
//  Cocktail DB
//
//  Created by Olha Bereziuk on 22.06.2020.
//  Copyright © 2020 Olha Bereziuk. All rights reserved.
//

import Foundation

//Handle displaying user selected gategories
extension DrinksViewController {
    
    func setupDefaultCondition() {
        if !defaultPresenter.isDefaultCondition {
            defaultPresenter.loadAllCategories { defaultCategories in
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            }
            defaultPresenter.cahgeDefaultConditionFlag()
        }
    }

    func displayUserSelectedDrinks() {
        presenter.removeAllDrinksFromArr()
        restoreSelectedCategories()
        prepareToDisplayDrinksList()
    }
    
    func prepareToDisplayDrinksList() {
        if !restoredCategories.isEmpty {
            guard let firstCategoryToLoad = restoredCategories.first! else { return }
            loadCategoryDrinks(firstCategoryToLoad)
            restoredCategories.removeFirst()
        }
        else {
            self.tableView.reloadData()
            return
        }
    }
    
    func restoreSelectedCategories() {
        let categories = self.defaults.object(forKey: "selectedCategories") as? [String] ?? [String]()
        self.restoredCategories = categories.sorted()
        self.categoryTitles = categories.sorted()
    }
    
    func loadCategoryDrinks(_ category: String) {
        presenter.loadDrinks(category) { [weak self] drinks in
            DispatchQueue.main.async {
                self?.tableView.reloadData()
            }
        }
    }
}
