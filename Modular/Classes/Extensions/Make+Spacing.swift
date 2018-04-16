//
//  Make+Spacing.swift
//  Modular
//
//  Created by Ondrej Rafaj on 02/12/2017.
//

import Foundation
#if os(iOS) || os(tvOS)
    @_exported import UIKit
#elseif os(OSX)
    @_exported import Cocoa
#endif
@_exported import SnapKit


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
    
    @discardableResult public func match(horizontalPosition view: ViewAlias) -> Make<T> {
        element.snp.makeConstraints { (make) in
            make.left.right.equalTo(view)
        }
        return self
    }
    
    @discardableResult public func match(left view: ViewAlias, offset: CGFloat = 0) -> Make<T> {
        element.snp.makeConstraints { (make) in
            make.left.equalTo(view).offset(offset)
        }
        return self
    }
    
    @discardableResult public func match(right view: ViewAlias, offset: CGFloat = 0) -> Make<T> {
        element.snp.makeConstraints { (make) in
            make.right.equalTo(view).offset(offset)
        }
        return self
    }
    
    @discardableResult public func match(verticalPosition view: ViewAlias) -> Make<T> {
        element.snp.makeConstraints { (make) in
            make.top.bottom.equalTo(view)
        }
        return self
    }
    
    @discardableResult public func match(top view: ViewAlias, offset: CGFloat = 0) -> Make<T> {
        element.snp.makeConstraints { (make) in
            make.top.equalTo(view).offset(offset)
        }
        return self
    }
    
    @discardableResult public func match(bottom view: ViewAlias, offset: CGFloat = 0) -> Make<T> {
        element.snp.makeConstraints { (make) in
            make.bottom.equalTo(view).offset(offset)
        }
        return self
    }
    
    @discardableResult public func match(center view: ViewAlias) -> Make<T> {
        element.snp.makeConstraints { (make) in
            make.center.equalTo(view)
        }
        return self
    }
    
    @discardableResult public func match(centerX view: ViewAlias, offset: CGFloat = 0) -> Make<T> {
        element.snp.makeConstraints { (make) in
            make.centerX.equalTo(view).offset(offset)
        }
        return self
    }
    
    @discardableResult public func match(centerY view: ViewAlias, offset: CGFloat = 0) -> Make<T> {
        element.snp.makeConstraints { (make) in
            make.centerY.equalTo(view).offset(offset)
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
    
    @discardableResult public func center() -> Make<T> {
        element.snp.makeConstraints { (make) in
            make.center.equalToSuperview()
        }
        return self
    }
    
    @discardableResult public func centerX(offset: CGFloat = 0) -> Make<T> {
        element.snp.makeConstraints { (make) in
            make.centerX.equalToSuperview().offset(offset)
        }
        return self
    }
    
    @discardableResult public func centerY(offset: CGFloat = 0) -> Make<T> {
        element.snp.makeConstraints { (make) in
            make.centerY.equalToSuperview().offset(offset)
        }
        return self
    }
    
    
}
