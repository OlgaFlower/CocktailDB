//
//  CocktailsListViewController.swift
//  Cocktail DB
//
//  Created by Olha Bereziuk on 21.06.2020.
//  Copyright © 2020 Olha Bereziuk. All rights reserved.
//

import UIKit

class CocktailsListViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    let presenter = CoctailsListPresenter()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.loadCocktailGroup { [weak self] group in
            DispatchQueue.main.async {
                self?.tableView.reloadData()
            }
        }
    }
    
    
}

extension CocktailsListViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        1
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cocktailCell", for: indexPath) as! CocktailTableViewCell
        cell.selectionStyle = .none
        
        return cell
    }
    
    
}
