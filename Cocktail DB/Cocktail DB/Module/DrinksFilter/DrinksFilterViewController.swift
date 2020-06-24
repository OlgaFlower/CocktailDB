//
//  DrinksFilterViewController.swift
//  Cocktail DB
//
//  Created by Olha Bereziuk on 22.06.2020.
//  Copyright © 2020 Olha Bereziuk. All rights reserved.
//

import UIKit

class DrinksFilterViewController: UIViewController {
    
    //MARK: - Outlets
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var applyButton: UIButton!
    
    //MARK: - Properties
    let presenter = DrinksFilterPresenter()
    var selectedCategories = [String?]()
    let defaults = UserDefaults.standard
    
    //MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setup()
        presenter.loadCocktailGroup { [weak self] group in
            DispatchQueue.main.async {
                self?.tableView.reloadData()
            }
        }
    }
    
    //MARK: - Setup VC methods
    func setup() {
        setupTableView()
        restoreSelectedCategories()
    }
    
    func setupTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.removeSeparator()
        tableView.allowsMultipleSelection = true
    }
    
    //MARK: - Restore previously selected categories
    func restoreSelectedCategories() {
        selectedCategories = defaults.object(forKey: "selectedCategories") as? [String] ?? [String]()
    }
    
    //MARK: - Actions
    @IBAction func applyButtonTapped(_ sender: Any) {
        defaults.set(selectedCategories, forKey: "selectedCategories")
        _ = navigationController?.popViewController(animated: true)
    }
    
}


