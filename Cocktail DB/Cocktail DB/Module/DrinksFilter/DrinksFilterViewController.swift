//
//  DrinksFilterViewController.swift
//  Cocktail DB
//
//  Created by Olha Bereziuk on 22.06.2020.
//  Copyright © 2020 Olha Bereziuk. All rights reserved.
//

import UIKit

class DrinksFilterViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    let presenter = DrinksFilterPresenter()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.loadCocktailGroup { [weak self] group in
            DispatchQueue.main.async {
                self?.tableView.reloadData()
            }
        }
    }
    
}

extension DrinksFilterViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        presenter.drinksGroup?.categoryGroup?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cocktailCell", for: indexPath) as! DrinksFilterTableViewCell
        guard let drinks = presenter.drinksGroup?.categoryGroup else { return UITableViewCell() }
        cell.categoryNameLabel.text = drinks[indexPath.row].category
        
        return cell
    }
}
