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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        presenter.loadDrinks("Cocktail") { [weak self] drinks in
            DispatchQueue.main.async {
                self?.tableView.reloadData()
            }
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
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

