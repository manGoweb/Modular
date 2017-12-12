//
//  UIColor+Tools.swift
//  Modular_Example
//
//  Created by Ondrej Rafaj on 02/12/2017.
//  Copyright © 2017 CocoaPods. All rights reserved.
//

import Foundation
import UIKit


extension UIColor {
    
    static var random: UIColor {
        let hue = CGFloat(Double(arc4random() % 256) / 256.0)
        let saturation = CGFloat(Double(arc4random() % 128) / 256.0 + 0.5)
        let brightness = CGFloat(Double(arc4random() % 128) / 256.0 + 0.5)
        return UIColor(hue: hue, saturation: saturation, brightness: brightness, alpha: 1.0)
    }
    
}
