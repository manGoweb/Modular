//
//  Make+Spacing.swift
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
    
    @discardableResult public func sideToSide() -> Make<T> {
        element.snp.makeConstraints { (make) in
            make.left.right.equalToSuperview()
        }
        return self
    }
    
    @discardableResult public func topToBottom() -> Make<T> {
        element.snp.makeConstraints { (make) in
            make.top.bottom.equalToSuperview()
        }
        return self
    }
    
    @discardableResult public func sideMargins(left: CGFloat = Modular.leftMargin, right: CGFloat = Modular.rightMargin) -> Make<T> {
        element.snp.makeConstraints { (make) in
            make.left.equalToSuperview().offset(left)
            make.right.equalToSuperview().offset(right)
        }
        return self
    }
    
    @discardableResult public func topMargin(_ top: CGFloat = Modular.topMargin) -> Make<T> {
        element.snp.makeConstraints { (make) in
            make.top.equalToSuperview().offset(top)
        }
        return self
    }
    
    @discardableResult public func leftMargin(_ left: CGFloat = Modular.leftMargin) -> Make<T> {
        element.snp.makeConstraints { (make) in
            make.left.equalToSuperview().offset(left)
        }
        return self
    }
    
    @discardableResult public func rightMargin(_ right: CGFloat = Modular.rightMargin) -> Make<T> {
        element.snp.makeConstraints { (make) in
            make.right.equalToSuperview().offset(right)
        }
        return self
    }
    
    @discardableResult public func minBottomMargin(_ bottom: CGFloat = Modular.bottomMargin) -> Make<T> {
        element.snp.makeConstraints { (make) in
            make.bottom.lessThanOrEqualTo(bottom)
        }
        return self
    }
    
    @discardableResult public func bottomMargin(_ bottom: CGFloat = Modular.bottomMargin) -> Make<T> {
        element.snp.makeConstraints { (make) in
            make.bottom.equalToSuperview().offset(bottom)
        }
        return self
    }
    
}
