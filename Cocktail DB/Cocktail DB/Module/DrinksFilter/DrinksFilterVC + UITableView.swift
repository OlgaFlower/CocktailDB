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
        
        cell.categoryNameLabel.text = drinks[indexPath.row].category
        
        return cell
    }
}
