//
//  UIColor+Extension.swift
//  Demo
//
//  Created by Aleksander Loghozinsky on 01.06.2021.
//

import UIKit

public extension UIColor {
    class var randomColor: UIColor {
        UIColor(
            hue: CGFloat(arc4random() % 256) / 256, // use 256 to get full range from 0.0 to 1.0
            saturation: CGFloat(arc4random() % 128) / 256 + 0.5, // from 0.5 to 1.0 to stay away from white
            brightness: CGFloat(arc4random() % 128) / 256 + 0.5, // from 0.5 to 1.0 to stay away from black
            alpha: 1
        )
    }
}
