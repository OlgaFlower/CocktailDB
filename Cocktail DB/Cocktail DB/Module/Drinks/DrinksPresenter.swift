//
//  CocktailsListPresenter.swift
//  Cocktail DB
//
//  Created by Olha Bereziuk on 21.06.2020.
//  Copyright © 2020 Olha Bereziuk. All rights reserved.
//

import UIKit

class DrinksPresenter {
    
//    var drinksList: Drinks?
    var allDrinksToDisplay = [Drinks?]()
    
    func loadDrinks(_ category: String, completion: @escaping (Drinks) -> Void) {
        NetworkManager.shared.fetchDrinksByCategory(category) { [weak self] drinks in
            self?.allDrinksToDisplay.append(drinks)
            completion(drinks)
        }
    }
    
    func displayDrinkImage(_ imageURL: String?, _ imageView: UIImageView) {
        guard let urlString = imageURL, let url = URL(string: urlString) else { return }
        UIImage.loadImageFrom(url: url) { image in
            if url.absoluteString == urlString {
                imageView.image = image
            }
        }
    }

}
