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
    
    func setup() {
        setupNavBarItems()
        setupTableView()
    }
    
    func setupNavBarItems() {
        let viewName = UIBarButtonItem(title: "Drinks", style: .plain, target: self, action: nil)
        navigationItem.leftBarButtonItem = viewName
    }
    
    func setupTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.removeSeparator()
    }
}

extension DrinksViewController: UITableViewDataSource, UITableViewDelegate {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        1
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        presenter.drinksList?.drinks?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cocktailCell", for: indexPath) as! DrinksTableViewCell
        let imageURL = presenter.drinksList?.drinks?[indexPath.row].imageURL
        cell.selectionStyle = .none
        cell.cocktailNameLabel.text = presenter.drinksList?.drinks?[indexPath.row].name
        DispatchQueue.main.async {
            self.presenter.displayDrinkImage(imageURL, cell.cocktailImage)
        }
        
        return cell
    }
    
//    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
//        guard let drinks = presenter.drinksList?.drinks else { return }
//        let lastItem = drinks.count - 1
//        if indexPath.row == lastItem {
//
//        }
//    }
    
}



