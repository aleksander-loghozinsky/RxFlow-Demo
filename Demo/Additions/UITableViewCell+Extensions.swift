//
//  UITableViewCell+Extensions.swift
//  Demo
//
//  Created by Aleksander Loghozinsky on 01.06.2021.
//

import UIKit

extension UITableViewCell {
    
    static var reuseIdentifier: String {
        String(describing: Self.identifier)
    }
}
