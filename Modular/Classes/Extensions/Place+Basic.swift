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
    
    public func on(_ view: ViewAlias, width: CGFloat? = nil, height: CGFloat? = nil, top: CGFloat? = nil, bottom: CGFloat? = nil) -> Make<T> {
        view.addSubview(element)
        if width != nil || height != nil || top != nil || bottom != nil {
            element.snp.makeConstraints { (make) in
                if top != nil {
                    make.top.equalToSuperview().offset(top!)
                }
                set(width: width, height: height, on: make)
                if bottom != nil {
                    make.bottom.equalToSuperview().offset(bottom!)
                }
            }
        }
        return Make(element)
    }
    
    public func above(_ view: ViewAlias, width: CGFloat? = nil, height: CGFloat? = nil, bottom: CGFloat = Modular.verticalSpacingMargin) -> Make<T> {
        guard let superview = view.superview else {
            fatalError("Other view doesn't have a superview")
        }
        superview.addSubview(element)
        element.snp.makeConstraints { (make) in
            make.bottom.equalTo(view.snp.top).offset(bottom)
            set(width: width, height: height, on: make)
        }
        return Make(element)
    }
    
    public func below(_ view: ViewAlias, width: CGFloat? = nil, height: CGFloat? = nil, top: CGFloat = Modular.verticalSpacingMargin) -> Make<T> {
        guard let superview = view.superview else {
            fatalError("Other view doesn't have a superview")
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
            fatalError("Other view doesn't have a superview")
        }
        superview.addSubview(element)
        element.snp.makeConstraints { (make) in
            make.left.equalTo(view.snp.right).offset(left)
            set(width: width, height: height, on: make)
        }
        return Make(element)
    }
    
    public func before(_ view: ViewAlias, width: CGFloat? = nil, height: CGFloat? = nil, right: CGFloat = Modular.horizontalSpacingMargin) -> Make<T> {
        guard let superview = view.superview else {
            fatalError("Other view doesn't have a superview")
        }
        superview.addSubview(element)
        element.snp.makeConstraints { (make) in
            make.right.equalTo(view.snp.left).offset(right)
            set(width: width, height: height, on: make)
        }
        return Make(element)
    }
    
    @discardableResult public func between(_ view1: ViewAlias, and view2: ViewAlias, width: CGFloat? = nil, height: CGFloat? = nil, top: CGFloat = 0, left: CGFloat = Modular.horizontalSpacingMargin, right: CGFloat = -Modular.horizontalSpacingMargin) -> Make<T> {
        guard let superview = view1.superview, let _ = view2.superview else {
            fatalError("One of the other views doesn't have a superview")
        }
        superview.addSubview(element)
        element.snp.makeConstraints { (make) in
            make.left.equalTo(view1.snp.right).offset(left)
            make.right.equalTo(view2.snp.left).offset(right)
            set(width: width, height: height, on: make)
        }
        return Make(element)
    }
    
    public func onBottom(of view: ViewAlias, width: CGFloat? = nil, height: CGFloat? = nil, bottom: CGFloat = 0) -> Make<T> {
        view.addSubview(element)
        element.snp.makeConstraints { (make) in
            make.bottom.equalToSuperview().offset(bottom)
            set(width: width, height: height, on: make)
        }
        return Make(element)
    }
    
    public func onTopLeft(of view: ViewAlias, width: CGFloat? = nil, height: CGFloat? = nil, top: CGFloat? = nil, left: CGFloat? = nil) -> Make<T> {
        view.addSubview(element)
        element.snp.makeConstraints { (make) in
            if top != nil {
                make.top.equalToSuperview().offset(top!)
            }
            if left != nil {
                make.left.equalToSuperview().offset(left!)
            }
            set(width: width, height: height, on: make)
        }
        return Make(element)
    }
    
    public func onTopRight(of view: ViewAlias, width: CGFloat? = nil, height: CGFloat? = nil, top: CGFloat? = nil, right: CGFloat? = nil) -> Make<T> {
        view.addSubview(element)
        element.snp.makeConstraints { (make) in
            if top != nil {
                make.top.equalToSuperview().offset(top!)
            }
            if right != nil {
                make.right.equalToSuperview().offset(right!)
            }
            set(width: width, height: height, on: make)
        }
        return Make(element)
    }
    
    // MARK: Private helpers
    
    private func set(width: CGFloat?, height: CGFloat?, on make: SnapKit.ConstraintMaker) {
        if let height = height {
            make.height.equalTo(height)
        }
        if let width = width {
            make.width.equalTo(width)
        }
    }
    
}

