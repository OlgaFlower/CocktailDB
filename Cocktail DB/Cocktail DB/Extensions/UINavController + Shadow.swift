//
//  UINavController + Shadow.swift
//  Cocktail DB
//
//  Created by Olha Bereziuk on 22.06.2020.
//  Copyright © 2020 Olha Bereziuk. All rights reserved.
//

import UIKit

extension UINavigationController {
    func displayNavbarShadow() {
        self.navigationBar.shadowImage = UIImage()
        self.navigationBar.layer.shadowColor = UIColor.black.cgColor
        self.navigationBar.layer.shadowOpacity = 0.7
        self.navigationBar.layer.shadowOffset = CGSize.zero
        self.navigationBar.layer.shadowRadius = 6
    }
}
