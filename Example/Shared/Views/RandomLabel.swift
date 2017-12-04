//
//  RandomLabel.swift
//  Modular_Example
//
//  Created by Ondrej Rafaj on 02/12/2017.
//  Copyright © 2017 CocoaPods. All rights reserved.
//

import Foundation
import UIKit


class RandomLabel: UILabel {
    
    init() {
        super.init(frame: CGRect.zero)
        
        textColor = .random
        backgroundColor = .random
        numberOfLines = 0
        
        text = "Random"
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
