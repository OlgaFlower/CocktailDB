//
//  DrinksViewController.swift
//  Cocktail DB
//
//  Created by Olha Bereziuk on 21.06.2020.
//  Copyright © 2020 Olha Bereziuk. All rights reserved.
//

import UIKit

class DrinksViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    let presenter = DrinksPresenter()
    
    var restoredCategories = [String?]()
    var categoryTitles = [String?]() //****
    let defaults = UserDefaults.standard
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        displayDrinks()
        print("Restored catrgoties \(restoredCategories)")
    }
    
    func setup() {
        setupNavBarItems()
        setupTableView()
    }
    
    func setupNavBarItems() {
        let viewName = UIBarButtonItem(title: "Drinks", style: .plain, target: self, action: nil)
        navigationItem.leftBarButtonItem = viewName
        let filter = UIBarButtonItem(image: UIImage(named: "filter.png"), style: .plain, target: self, action: #selector(showFilter))
        navigationItem.rightBarButtonItem = filter
        self.navigationController?.displayNavbarShadow()
    }
    
    func setupTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.removeSeparator()
    }
    
    @objc func showFilter() {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let filterVC = storyboard.instantiateViewController(withIdentifier: "DrinksFilterViewController") as! DrinksFilterViewController
        self.navigationController?.pushViewController(filterVC, animated: true)
    }
}

