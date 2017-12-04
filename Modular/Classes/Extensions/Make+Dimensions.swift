//
//  Make+Dimensions.swift
//  Pods
//
//  Created by Ondrej Rafaj on 03/12/2017.
//

import Foundation
#if os(iOS) || os(tvOS)
    import UIKit
#elseif os(OSX)
    import Cocoa
#endif
import SnapKit


extension Make where T: ViewAlias {
    
    @discardableResult public func width(_ width: CGFloat) -> Make<T> {
        element.snp.makeConstraints { (make) in
            make.width.equalTo(width)
        }
        return self
    }
    
    @discardableResult public func height(_ height: CGFloat) -> Make<T> {
        element.snp.makeConstraints { (make) in
            make.height.equalTo(height)
        }
        return self
    }
    
    @discardableResult public func match(dimensions view: ViewAlias) -> Make<T> {
        element.snp.makeConstraints { (make) in
            make.width.height.equalTo(view)
        }
        return self
    }
    
    @discardableResult public func match(width view: ViewAlias, offset: CGFloat = 0) -> Make<T> {
        element.snp.makeConstraints { (make) in
            make.width.equalTo(view).offset(offset)
        }
        return self
    }
    
    @discardableResult public func match(height view: ViewAlias, offset: CGFloat = 0) -> Make<T> {
        element.snp.makeConstraints { (make) in
            make.height.equalTo(view).offset(offset)
        }
        return self
    }
    
    
    
}
