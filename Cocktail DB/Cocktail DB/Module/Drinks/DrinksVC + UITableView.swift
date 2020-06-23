//
//  DrinksVC + UITableView.swift
//  Cocktail DB
//
//  Created by Olha Bereziuk on 22.06.2020.
//  Copyright © 2020 Olha Bereziuk. All rights reserved.
//

import UIKit

extension DrinksViewController: UITableViewDataSource, UITableViewDelegate {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return presenter.allDrinksToDisplay.count
    }
    
    func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        if let headerView = view as? UITableViewHeaderFooterView {
            headerView.contentView.backgroundColor = .white
            headerView.textLabel?.textColor = .gray
        }
    }
    
//    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
//        print("titleForHeaderInSection section: \(section)")
//        return "uuu"
//    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter.allDrinksToDisplay[section]?.drinks?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "drinkCell", for: indexPath) as! DrinksTableViewCell
        guard let section = presenter.allDrinksToDisplay[indexPath.section] else { return UITableViewCell() }
        cell.selectionStyle = .none
        
        cell.cocktailNameLabel.text = section.drinks?[indexPath.row].name
        
        let imageURL = section.drinks?[indexPath.row].imageURL
        DispatchQueue.main.async {
            self.presenter.displayDrinkImage(imageURL, cell.cocktailImage)
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        
        guard let currentCategory = presenter.allDrinksToDisplay[indexPath.section] else { return }
        guard let itemsCount = currentCategory.drinks?.count else { return }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
            if tableView.visibleCells.contains(cell) {
                
                if indexPath.row == itemsCount - 1 {
                    
                    if !self.restoredCategories.isEmpty {
                        guard let nextCategory = self.restoredCategories.first! else { return }
                        print("let nextCategory = self.restoredCategories.first! : \(nextCategory)")
                        self.restoredCategories.removeFirst()
                        self.loadCategoryDrinks(nextCategory)
                        
                    }
                    
//                    if self.presenter.allDrinksToDisplay.count < self.restoredCategories.count {
//                        let nextSection = indexPath.section + 1
//                        guard let nextCategory = self.restoredCategories[nextSection] else { return }
//                        self.loadCategoryDrinks(nextCategory)
//                    }
                }
                
            }
        }
    }
    
}


