//
//  DrinksFilterVC + UITableView.swift
//  Cocktail DB
//
//  Created by Olha Bereziuk on 22.06.2020.
//  Copyright © 2020 Olha Bereziuk. All rights reserved.
//


import UIKit

extension DrinksFilterViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter.drinksGroup?.categoryGroup?.count ?? 0
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "filterCell", for: indexPath) as! DrinksFilterTableViewCell
        
        guard let drinks = presenter.drinksGroup?.categoryGroup else { return UITableViewCell() }
        
        if selectedCategories.contains(drinks[indexPath.row].category) {
            cell.accessoryType = .checkmark
            
        } else {
            cell.accessoryType = .none
        }
        
        cell.categoryNameLabel.text = drinks[indexPath.row].category
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        guard let categories = presenter.drinksGroup?.categoryGroup else { return }
        
        if selectedCategories.contains(categories[indexPath.row].category) {
            //Remove item from selected categories
            selectedCategories.removeAll { (selectedCategory) -> Bool in
                selectedCategory == categories[indexPath.row].category
            }
            print("After remove: \(selectedCategories)")
            tableView.reloadRows(at: [indexPath], with: .fade)
            
        } else {
            //Add checkmark and selected category
            selectedCategories.append(categories[indexPath.row].category)
            print("After add: \(selectedCategories)")
            tableView.reloadRows(at: [indexPath], with: .fade)
        }
    }
    
    
}
