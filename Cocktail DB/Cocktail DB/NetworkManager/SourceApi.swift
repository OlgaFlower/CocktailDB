//
//  SourceApi.swift
//  Cocktail DB
//
//  Created by Olha Bereziuk on 21.06.2020.
//  Copyright © 2020 Olha Bereziuk. All rights reserved.
//

import Foundation

enum SourceApi: String {
    case categories = "https://www.thecocktaildb.com/api/json/v1/1/list.php?c=list"
    case drinks = "https://www.thecocktaildb.com/api/json/v1/1/filter.php?c="
}
