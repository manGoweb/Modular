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
        let viewAttributes = constraintAttributes()
        element.snp.makeConstraints { (make) in
            make.left.equalTo(viewAttributes.left)
            make.right.equalTo(viewAttributes.right)
        }
        return self
    }
    
    @discardableResult public func topToBottom() -> Make<T> {
        let viewAttributes = constraintAttributes()
        element.snp.makeConstraints { (make) in
            make.top.equalTo(viewAttributes.top)
            make.bottom.equalTo(viewAttributes.bottom)
        }
        return self
    }
    
    @discardableResult public func match(horizontalPosition view: ViewAlias) -> Make<T> {
        let viewAttributes = constraintAttributes()
        element.snp.makeConstraints { (make) in
            make.left.equalTo(viewAttributes.left)
            make.right.equalTo(viewAttributes.right)
        }
        return self
    }
    
    @discardableResult public func match(left view: ViewAlias, offset: CGFloat = 0) -> Make<T> {
        let viewAttributes = constraintAttributes()
        element.snp.makeConstraints { (make) in
            make.left.equalTo(viewAttributes.left).offset(offset)
        }
        return self
    }
    
    @discardableResult public func match(right view: ViewAlias, offset: CGFloat = 0) -> Make<T> {
        let viewAttributes = constraintAttributes()
        element.snp.makeConstraints { (make) in
            make.right.equalTo(viewAttributes.right).offset(offset)
        }
        return self
    }
    
    @discardableResult public func match(verticalPosition view: ViewAlias) -> Make<T> {
        let viewAttributes = constraintAttributes()
        element.snp.makeConstraints { (make) in
            make.top.equalTo(viewAttributes.top)
            make.bottom.equalTo(viewAttributes.bottom)
        }
        return self
    }
    
    @discardableResult public func match(top view: ViewAlias, offset: CGFloat = 0) -> Make<T> {
        let viewAttributes = constraintAttributes()
        element.snp.makeConstraints { (make) in
            make.top.equalTo(viewAttributes.top).offset(offset)
        }
        return self
    }
    
    @discardableResult public func match(bottom view: ViewAlias, offset: CGFloat = 0) -> Make<T> {
        let viewAttributes = constraintAttributes()
        element.snp.makeConstraints { (make) in
            make.bottom.equalTo(viewAttributes.bottom).offset(offset)
        }
        return self
    }
    
    @discardableResult public func match(center view: ViewAlias) -> Make<T> {
        let viewAttributes = constraintAttributes()
        element.snp.makeConstraints { (make) in
            make.center.equalTo(viewAttributes.center)
        }
        return self
    }
    
    @discardableResult public func match(centerX view: ViewAlias, offset: CGFloat = 0) -> Make<T> {
        let viewAttributes = constraintAttributes()
        element.snp.makeConstraints { (make) in
            make.centerX.equalTo(viewAttributes.centerX).offset(offset)
        }
        return self
    }
    
    @discardableResult public func match(centerY view: ViewAlias, offset: CGFloat = 0) -> Make<T> {
        let viewAttributes = constraintAttributes()
        element.snp.makeConstraints { (make) in
            make.centerY.equalTo(viewAttributes.centerY).offset(offset)
        }
        return self
    }
    
    @discardableResult public func sideMargins(left: CGFloat = Modular.leftMargin, right: CGFloat = Modular.rightMargin) -> Make<T> {
        let viewAttributes = constraintAttributes()
        element.snp.makeConstraints { (make) in
            make.left.equalTo(viewAttributes.left).offset(left)
            make.right.equalTo(viewAttributes.right).offset(right)
        }
        return self
    }
    
    @discardableResult public func topMargin(_ top: CGFloat = Modular.topMargin) -> Make<T> {
        let viewAttributes = constraintAttributes()
        element.snp.makeConstraints { (make) in
            make.top.equalTo(viewAttributes.top).offset(top)
        }
        return self
    }
    
    @discardableResult public func leftMargin(_ left: CGFloat = Modular.leftMargin) -> Make<T> {
        let viewAttributes = constraintAttributes()
        element.snp.makeConstraints { (make) in
            make.left.equalTo(viewAttributes.left).offset(left)
        }
        return self
    }
    
    @discardableResult public func rightMargin(_ right: CGFloat = Modular.rightMargin) -> Make<T> {
        let viewAttributes = constraintAttributes()
        element.snp.makeConstraints { (make) in
            make.right.equalTo(viewAttributes.right).offset(right)
        }
        return self
    }
    
    @discardableResult public func minBottomMargin(_ bottom: CGFloat = Modular.bottomMargin) -> Make<T> {
        let viewAttributes = constraintAttributes()
        element.snp.makeConstraints { (make) in
            make.bottom.lessThanOrEqualTo(viewAttributes.bottom).offset(bottom)
        }
        return self
    }
    
    @discardableResult public func bottomMargin(_ bottom: CGFloat = Modular.bottomMargin) -> Make<T> {
        let viewAttributes = constraintAttributes()
        element.snp.makeConstraints { (make) in
            make.bottom.equalTo(viewAttributes.bottom).offset(bottom)
        }
        return self
    }
    
    @discardableResult public func center() -> Make<T> {
        let viewAttributes = constraintAttributes()
        element.snp.makeConstraints { (make) in
            make.center.equalTo(viewAttributes.center)
        }
        return self
    }
    
    @discardableResult public func centerX(offset: CGFloat = 0) -> Make<T> {
        let viewAttributes = constraintAttributes()
        element.snp.makeConstraints { (make) in
            make.centerX.equalTo(viewAttributes.centerX).offset(offset)
        }
        return self
    }
    
    @discardableResult public func centerY(offset: CGFloat = 0) -> Make<T> {
        let viewAttributes = constraintAttributes()
        element.snp.makeConstraints { (make) in
            make.centerY.equalTo(viewAttributes.centerY).offset(offset)
        }
        return self
    }
    
    
    // MARK: - Greater Than Equal To constraints
    
    @discardableResult public func topMarginGreaterThanEqualTo(view: ViewAlias? = nil, top: CGFloat = Modular.topMargin) -> Make<T> {
        let viewAttributes = constraintAttributes(for: view)
        element.snp.makeConstraints { (make) in
            make.top.greaterThanOrEqualTo(viewAttributes.top).offset(top)
        }
        return self
    }
    
    @discardableResult public func leftMarginGreaterThanEqualTo(view: ViewAlias? = nil, left: CGFloat = Modular.leftMargin) -> Make<T> {
        let viewAttributes = constraintAttributes(for: view)
        element.snp.makeConstraints { (make) in
            make.left.greaterThanOrEqualTo(viewAttributes.left).offset(left)
        }
        return self
    }
    
    @discardableResult public func rightMarginGreaterThanEqualTo(view: ViewAlias? = nil, right: CGFloat = Modular.rightMargin) -> Make<T> {
        let viewAttributes = constraintAttributes(for: view)
        element.snp.makeConstraints { (make) in
            make.right.greaterThanOrEqualTo(viewAttributes.right).offset(right)
        }
        return self
    }
    
    @discardableResult public func bottomMarginGreaterThanEqualTo(view: ViewAlias? = nil, bottom: CGFloat = Modular.bottomMargin) -> Make<T> {
        let viewAttributes = constraintAttributes(for: view)
        element.snp.makeConstraints { (make) in
            make.bottom.greaterThanOrEqualTo(viewAttributes.bottom).offset(bottom)
        }
        return self
    }
    
    // MARK: - Less Than Equal To constraints
    
    @discardableResult public func topMarginLessThanEqualTo(view: ViewAlias? = nil, top: CGFloat = Modular.topMargin) -> Make<T> {
        let viewAttributes = constraintAttributes(for: view)
        element.snp.makeConstraints { (make) in
            make.top.lessThanOrEqualTo(viewAttributes.top).offset(top)
        }
        return self
    }
    
    
    @discardableResult public func leftMarginLessThanEqualTo(view: ViewAlias? = nil, left: CGFloat = Modular.leftMargin) -> Make<T> {
        let viewAttributes = constraintAttributes(for: view)
        element.snp.makeConstraints { (make) in
            make.left.lessThanOrEqualTo(viewAttributes.left).offset(left)
        }
        return self
    }
    
    @discardableResult public func rightMarginLessThanEqualTo(view: ViewAlias? = nil, right: CGFloat = Modular.rightMargin) -> Make<T> {
        let viewAttributes = constraintAttributes(for: view)
        element.snp.makeConstraints { (make) in
            make.right.lessThanOrEqualTo(viewAttributes.right).offset(right)
        }
        return self
    }
    
    @discardableResult public func bottomMarginLessThanEqualTo(view: ViewAlias? = nil, bottom: CGFloat = Modular.bottomMargin) -> Make<T> {
        let viewAttributes = constraintAttributes(for: view)
        element.snp.makeConstraints { (make) in
            make.bottom.lessThanOrEqualTo(viewAttributes.bottom).offset(bottom)
        }
        return self
    }
    
    private func constraintAttributes(for view: ViewAlias? = nil) -> ConstraintBasicAttributesDSL {
        guard let view = view ?? element.superview else {
            fatalError("Expected superview but found nil when attempting make constraint")
        }
        
        return useSafeArea ? view.safeArea : view.snp
    }
}

extension ViewAlias {
    var safeArea: ConstraintBasicAttributesDSL {
        if #available(iOS 11.0, *) {
            return self.safeAreaLayoutGuide.snp
        } else {
            return self.snp
        }
    }
}
