//
//  UITableView + HideSeparator.swift
//  Cocktail DB
//
//  Created by Olha Bereziuk on 24.06.2020.
//  Copyright © 2020 Olha Bereziuk. All rights reserved.
//

import UIKit

//Hide cell's separator line
extension UITableView {
    func removeSeparator() {
        self.separatorStyle = .none
    }
}
