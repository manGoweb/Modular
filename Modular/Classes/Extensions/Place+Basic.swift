//
//  Place+Basic.swift
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


extension Place where T: ViewAlias {
    
    @discardableResult public func on(andFill view: ViewAlias) -> Make<T> {
        view.addSubview(element)
        element.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
        }
        return Make(element)
    }
    
    public func on(_ view: ViewAlias, width: CGFloat? = nil, height: CGFloat? = nil, top: CGFloat = Modular.topMargin, bottom: CGFloat? = nil) -> Make<T> {
        view.addSubview(element)
        element.snp.makeConstraints { (make) in
            make.top.equalToSuperview().offset(top)
            set(width: width, height: height, on: make)
            if bottom != nil {
                make.bottom.equalToSuperview().offset(bottom!)
            }
        }
        return Make(element)
    }
    
    public func below(_ view: ViewAlias, width: CGFloat? = nil, height: CGFloat? = nil, top: CGFloat = Modular.verticalSpacingMargin) -> Make<T> {
        guard let superview = view.superview else {
            fatalError("View doesn't have a superview")
        }
        superview.addSubview(element)
        element.snp.makeConstraints { (make) in
            make.top.equalTo(view.snp.bottom).offset(top)
            set(width: width, height: height, on: make)
        }
        return Make(element)
    }
    
    public func below(_ views: [ViewAlias], width: CGFloat? = nil, height: CGFloat? = nil, top: CGFloat = Modular.verticalSpacingMargin) -> Make<T> {
        guard let superview = views.first?.superview else {
            // TODO: Improve to check all views
            fatalError("One of the wiews doesn't have a superview")
        }
        superview.addSubview(element)
        element.snp.makeConstraints { (make) in
            for view in views {
                make.top.greaterThanOrEqualTo(view.snp.bottom).offset(top)
            }
            set(width: width, height: height, on: make)
        }
        return Make(element)
    }
    
    public func next(to view: ViewAlias, width: CGFloat? = nil, height: CGFloat? = nil, left: CGFloat = Modular.horizontalSpacingMargin) -> Make<T> {
        guard let superview = view.superview else {
            fatalError("View doesn't have a superview")
        }
        superview.addSubview(element)
        element.snp.makeConstraints { (make) in
            make.top.equalTo(view.snp.top)
            make.left.equalTo(view.snp.right).offset(left)
            set(width: width, height: height, on: make)
        }
        return Make(element)
    }
    
    public func before(_ view: ViewAlias, width: CGFloat? = nil, height: CGFloat? = nil, right: CGFloat = Modular.horizontalSpacingMargin) -> Make<T> {
        guard let superview = view.superview else {
            fatalError("View doesn't have a superview")
        }
        superview.addSubview(element)
        element.snp.makeConstraints { (make) in
            make.top.equalTo(view.snp.top)
            make.right.equalTo(view.snp.left).offset(right)
            set(width: width, height: height, on: make)
        }
        return Make(element)
    }
    
    @discardableResult public func between(_ view1: ViewAlias, and view2: ViewAlias, width: CGFloat? = nil, height: CGFloat? = nil, top: CGFloat = 0, left: CGFloat = Modular.horizontalSpacingMargin, right: CGFloat = -Modular.horizontalSpacingMargin) -> Make<T> {
        guard let superview = view1.superview, let _ = view2.superview else {
            fatalError("One of the views doesn't have a superview")
        }
        superview.addSubview(element)
        element.snp.makeConstraints { (make) in
            make.top.equalTo(view1.snp.top).offset(top)
            make.left.equalTo(view1.snp.right).offset(left)
            make.right.equalTo(view2.snp.left).offset(right)
            set(width: width, height: height, on: make)
        }
        return Make(element)
    }
    
    public func on(bottom view: ViewAlias, width: CGFloat? = nil, height: CGFloat? = nil, bottom: CGFloat = 0) -> Make<T> {
        view.addSubview(element)
        element.snp.makeConstraints { (make) in
            make.bottom.equalToSuperview().offset(bottom)
            set(width: width, height: height, on: make)
        }
        return Make(element)
    }
    
    // MARK: Private helpers
    
    private func set(width: CGFloat?, height: CGFloat?, on make: SnapKit.ConstraintMaker) {
        if height != nil {
            make.height.equalTo(height!)
        }
        if width != nil {
            make.height.equalTo(height!)
        }
    }
    
}
