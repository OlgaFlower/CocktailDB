//
//  NetworkManager.swift
//  Cocktail DB
//
//  Created by Olha Bereziuk on 21.06.2020.
//  Copyright © 2020 Olha Bereziuk. All rights reserved.
//

import Foundation

class NetworkManager {
    
    private init() {}
    static let shared = NetworkManager()
    
    func fetchDrinksGroup(completion: @escaping (DrinksGroup) -> Void) {
        guard let url = URL(string: SourceApi.categories.rawValue) else { return }
        URLSession.shared.dataTask(with: url) { data, response, error in
            if error != nil {
                print("API: \(error!.localizedDescription)")
            }
            guard let data = data else {
                print("API: Error data downloading")
                return
            }
            do {
                let categories = try JSONDecoder().decode(DrinksGroup.self, from: data)
                completion(categories)
                } catch {
                    print("API: Error JSON decoding")
                }
        }.resume()
    }
    
    func fetchDrinksByCategory(_ category: String, completion: @escaping (Drinks) -> Void) {
        let urlString = SourceApi.drinks.rawValue + category
        guard let url = URL(string: urlString) else { return }
        URLSession.shared.dataTask(with: url) { data, response, error in
            if error != nil {
                print("API: \(error!.localizedDescription)")
            }
            guard let data = data else {
                print("API: Error data downloading")
                return
            }
            do {
                let drinks = try JSONDecoder().decode(Drinks.self, from: data)
                print(drinks)
                completion(drinks)
                } catch {
                    print("API: Error JSON decoding")
                }
        }.resume()
    }
}

