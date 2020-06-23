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
        
        if indexPath.row == itemsCount - 1 {
            print("last category item")
            print("indexPath.section \(indexPath.section)")
            let nextSection = indexPath.section + 1
            if nextSection < restoredCategories.count {
                guard let nextCategory = restoredCategories[nextSection] else {
                    print("RETURNED guard let nextCategory = restoredCategories[nextSection]")
                    return }
                loadCategoryDrinks(nextCategory)
            }
        }
        print("presenter.allDrinksToDisplay.count = \(presenter.allDrinksToDisplay.count)")
    }
    
}

//let lastItem = self.mes.count - 1
//if indexPath.row == lastItem {
//    print("IndexRow\(indexPath.row)")
//    if currentPage < totalPage {
//        currentPage += 1
//       //Get data from Server
//    }
//}
