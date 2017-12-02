//
//  Place+Basic.swift
//  Modular
//
//  Created by Ondrej Rafaj on 02/12/2017.
//

import Foundation
import UIKit
import SnapKit


extension Place where T: ViewAlias {
    
    @discardableResult public func on(andFill view: ViewAlias) -> Make<T> {
        view.addSubview(element)
        element.snp.makeConstraints { (make) in
            make.edges.equalTo(0)
        }
        return Make(element)
    }
    
    public func on(_ view: ViewAlias, width: CGFloat? = nil, height: CGFloat? = nil, top: CGFloat = Modular.topMargin) -> Make<T> {
        view.addSubview(element)
        element.snp.makeConstraints { (make) in
            make.top.equalTo(top)
            set(width: width, height: height, on: make)
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
            // TODO: Imrove to check all views
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
