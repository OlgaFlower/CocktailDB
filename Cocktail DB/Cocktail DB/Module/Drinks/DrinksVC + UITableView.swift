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
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
            return restoredCategories[section]
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter.allDrinksToDisplay[section]?.drinks?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let section = presenter.allDrinksToDisplay[indexPath.section] else { return UITableViewCell() }
        let cell = tableView.dequeueReusableCell(withIdentifier: "cocktailCell", for: indexPath) as! DrinksTableViewCell
        cell.selectionStyle = .none
        
        cell.cocktailNameLabel.text = section.drinks?[indexPath.row].name
        
        let imageURL = section.drinks?[indexPath.row].imageURL
        DispatchQueue.main.async {
            self.presenter.displayDrinkImage(imageURL, cell.cocktailImage)
        }
        
        return cell
    }
    
//    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
//        guard let drinks = presenter.drinksList?.drinks else { return }
//        let lastItem = drinks.count - 1
//        if indexPath.row == lastItem {
//
//        }
//    }
    
}
