//
//  Make+Shapes.swift
//  Modular
//
//  Created by Ondrej Rafaj on 02/12/2017.
//

import Foundation
import UIKit
import SnapKit


extension Make where T: ViewAlias {
    
    @discardableResult public func square(height: CGFloat? = nil) -> Make<T> {
        element.snp.makeConstraints { (make) in
            Debug.add(constraint: "width", for: element)
            make.width.equalTo(element.snp.height)
            guard let height = height else {
                return
            }
            make.height.equalTo(height)
        }
        return self
    }
    
    @discardableResult public func circle(radius: CGFloat) -> Make<T> {
        square(height: radius)
        element.layer.cornerRadius = (radius / 2.0)
        element.clipsToBounds = true
        return self
    }
    
}
