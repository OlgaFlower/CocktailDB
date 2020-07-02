//
//  DrinksVC + UITableView.swift
//  Cocktail DB
//
//  Created by Olha Bereziuk on 22.06.2020.
//  Copyright © 2020 Olha Bereziuk. All rights reserved.
//

import UIKit

//Table View
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
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return categoryTitles[section]
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter.allDrinksToDisplay[section]?.drinks?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "drinkCell", for: indexPath) as! DrinksTableViewCell
        
        guard let cellData = presenter.allDrinksToDisplay[indexPath.section]?.drinks?[indexPath.row] else { return UITableViewCell() }
        
        presenter.configureDrinksCell(cell, cellData)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        let sectionCount = presenter.allDrinksToDisplay.count
        if indexPath.section == sectionCount - 1 && indexPath.section < restoredCategories.count {
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                guard let currentSection = self.presenter.allDrinksToDisplay[indexPath.section] else { return }
                guard let sectionItemsCount = currentSection.drinks?.count else { return }
                
                if indexPath.row == sectionItemsCount - 1 {
                    
                    if !self.restoredCategories.isEmpty {
                        guard let nextSection = self.restoredCategories[indexPath.section] else { return }
                        self.loadCategoryDrinks(nextSection)
                        
                    }
                }
            }
        }
    }
}

