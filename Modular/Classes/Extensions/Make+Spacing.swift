//
//  Make+Spacing.swift
//  Modular
//
//  Created by Ondrej Rafaj on 02/12/2017.
//

import Foundation
import UIKit
import SnapKit


extension Make where T: ViewAlias {
    
    @discardableResult public func edgeToEdge() -> Make<T> {
        element.snp.makeConstraints { (make) in
            make.left.right.equalToSuperview()
        }
        return self
    }
    
    @discardableResult public func sideMargins(left: CGFloat = Modular.leftMargin, right: CGFloat = Modular.rightMargin) -> Make<T> {
        element.snp.makeConstraints { (make) in
            make.left.equalTo(left)
            make.right.equalTo(right)
        }
        return self
    }
    
    @discardableResult public func leftMargin(_ left: CGFloat = Modular.leftMargin) -> Make<T> {
        element.snp.makeConstraints { (make) in
            make.left.equalTo(left)
        }
        return self
    }
    
    @discardableResult public func rightMargin(_ right: CGFloat = Modular.leftMargin) -> Make<T> {
        element.snp.makeConstraints { (make) in
            make.right.equalTo(right)
        }
        return self
    }
    
}
