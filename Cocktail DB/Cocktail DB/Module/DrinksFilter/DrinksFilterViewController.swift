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
    @IBOutlet weak var applyButton: UIButton!
    
    let presenter = DrinksFilterPresenter()
    var selectedCategories = [String?]()
    var selectedIndexPaths = [IndexPath]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
        presenter.loadCocktailGroup { [weak self] group in
            DispatchQueue.main.async {
                self?.tableView.reloadData()
            }
        }
    }
    
    func setupTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.removeSeparator()
        tableView.allowsMultipleSelection = true
    }
    
    @IBAction func applyButtonTapped(_ sender: Any) {
        
    }
    
}


