//
//  Make+Shapes.swift
//  Modular
//
//  Created by Ondrej Rafaj on 02/12/2017.
//

import Foundation
#if os(iOS) || os(tvOS)
    import UIKit
#elseif os(OSX)
    import Cocoa
#endif
import SnapKit


extension Make where T: ViewAlias {
    
    @discardableResult public func square(side: CGFloat? = nil) -> Make<T> {
        element.snp.makeConstraints { (make) in
            make.width.equalTo(element.snp.height)
            guard let height = side else {
                return
            }
            make.height.equalTo(height)
        }
        return self
    }
    
    @discardableResult public func rectangle(width: CGFloat, height: CGFloat) -> Make<T> {
        element.snp.makeConstraints { (make) in
            make.width.equalTo(width)
            make.height.equalTo(height)
        }
        return self
    }
    
    #if os(iOS) || os(tvOS)
    
    @discardableResult public func circle(radius: CGFloat) -> Make<T> {
        square(side: radius)
        element.layer.cornerRadius = (radius / 2.0)
        element.clipsToBounds = true
        return self
    }
    
    #endif
    
    
}
