//
//  CocktailsListPresenter.swift
//  Cocktail DB
//
//  Created by Olha Bereziuk on 21.06.2020.
//  Copyright © 2020 Olha Bereziuk. All rights reserved.
//

import UIKit

protocol ConfigureDrinksCell: class {
    func configureDrinksCell(_ cell: DrinksTableViewCellProtocol, _ cellData: DrinkDescription)
}

class DrinksPresenter: ConfigureDrinksCell {
    
    var allDrinksToDisplay = [Drinks?]()
    
    //Load drinks list by category
    func loadDrinks(_ category: String, completion: @escaping (Drinks) -> Void) {
        NetworkManager.shared.fetchDrinksByCategory(category) { [weak self] drinks in
            self?.allDrinksToDisplay.append(drinks)
            completion(drinks)
        }
    }
    
    //Configure drinks list TableViewCell
    func configureDrinksCell(_ cell: DrinksTableViewCellProtocol, _ cellData: DrinkDescription) {
        cell.displayCocktailImage(imageURL: cellData.imageURL)
        cell.displayCocktailNameLabel(text: cellData.name)
    }
    
    func removeAllDrinksFromArr() {
        allDrinksToDisplay.removeAll()
    }
}
