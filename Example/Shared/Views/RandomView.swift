//
//  RandomView.swift
//  Modular_Example
//
//  Created by Ondrej Rafaj on 02/12/2017.
//  Copyright © 2017 CocoaPods. All rights reserved.
//

import Foundation
import UIKit


class RandomView: UIView {
    
    init() {
        super.init(frame: CGRect.zero)
        
        backgroundColor = .random
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
