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
    
    //*******
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return categoryTitles[section]
//        return restoredCategories[section]
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter.allDrinksToDisplay[section]?.drinks?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "drinkCell", for: indexPath) as! DrinksTableViewCell
        guard let section = presenter.allDrinksToDisplay[indexPath.section] else { return UITableViewCell() }
        cell.selectionStyle = .none
        
        cell.cocktailNameLabel.text = section.drinks?[indexPath.row].name
        
        guard let imageURL = section.drinks?[indexPath.row].imageURL else { return UITableViewCell() }
        cell.cocktailImage.loadImageFromURL(imageURL, placeHolder: nil)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        if indexPath.section == self.presenter.allDrinksToDisplay.count - 1 && indexPath.section < restoredCategories.count {
            print("indexPath.section = \(indexPath.section)")
            DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                guard let currentCategory = self.presenter.allDrinksToDisplay[indexPath.section] else { return }
                guard let itemsCount = currentCategory.drinks?.count else { return }
                
                if indexPath.row == itemsCount - 1 {
                    print("indexPath.row = \(indexPath.row)")
                    
                    if !self.restoredCategories.isEmpty {
                        guard let nextCategory = self.restoredCategories[indexPath.section] else { return }
                        self.loadCategoryDrinks(nextCategory)
                        
                    }
                }
            }
        }
    }
}


