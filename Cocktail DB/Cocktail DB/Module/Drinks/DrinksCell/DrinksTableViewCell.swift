//
//  CocktailTableViewCell.swift
//  Cocktail DB
//
//  Created by Olha Bereziuk on 21.06.2020.
//  Copyright © 2020 Olha Bereziuk. All rights reserved.
//

import UIKit

protocol DrinksTableViewCellProtocol: class {
    func displayCocktailImage(imageURL: String?)
    func displayCocktailNameLabel(text: String?)
}

class DrinksTableViewCell: UITableViewCell {
    
    //MARK: - Outlets
    @IBOutlet weak var cocktailImage: UIImageView!
    @IBOutlet weak var cocktailNameLabel: UILabel!
    
    //MARK: - Lifcycle
    override func awakeFromNib() {
        super.awakeFromNib()
        
        selectionStyle = .none
    }
}

extension DrinksTableViewCell: DrinksTableViewCellProtocol {
    func displayCocktailImage(imageURL: String?) {
        guard let url = imageURL else { return }
        cocktailImage.loadImageFromURL(url, placeHolder: nil)
    }
    
    func displayCocktailNameLabel(text: String?) {
        cocktailNameLabel.text = text
    }
}
