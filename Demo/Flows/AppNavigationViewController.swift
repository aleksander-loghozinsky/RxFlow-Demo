//
//  AppNavigationViewController.swift
//  Demo
//
//  Created by Aleksander Loghozinsky on 01.06.2021.
//

import UIKit

class AppNavigationViewController: UINavigationController {

    override func viewDidLoad() {
        super.viewDidLoad()

        navigationBar.setBackgroundImage(UIImage(), for: .default)
        navigationBar.shadowImage = UIImage()
        navigationBar.isTranslucent = true
        
        navigationBar.tintColor = .white
        navigationBar.titleTextAttributes = [.foregroundColor : UIColor.white]
    }

}
