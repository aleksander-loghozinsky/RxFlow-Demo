//
//  UINib+Extensions.swift
//  Demo
//
//  Created by Aleksander Loghozinsky on 30.05.2021.
//

import UIKit

extension UIViewController {
    
    convenience init(nibName nibNameOrNil: String?) {
        self.init(nibName: nibNameOrNil, bundle: nil)
    }
}

extension UINib {
    
    convenience init(nibName: String) {
        self.init(nibName: nibName, bundle: nil)
    }
}
