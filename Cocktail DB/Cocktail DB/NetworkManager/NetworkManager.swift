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
    
    func fetchCocktailCategories(completion: @escaping (CocktailGroup) -> Void) {
        guard let url = URL(string: SourceApi.categories.rawValue) else { return }
        URLSession.shared.dataTask(with: url) { data, response, error in
            if error != nil {
                print("Categories API: \(error!.localizedDescription)")
            }
            guard let data = data else {
                print("Categories API: Error data downloading")
                return
            }
            do {
                let categories = try JSONDecoder().decode(CocktailGroup.self, from: data)
                completion(categories)
                } catch {
                    print("Categories API: Error JSON decoding")
                }
        }.resume()
    }
}

