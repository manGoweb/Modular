//
//  NSLayoutConstraint+Modular.swift
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


extension NSLayoutConstraint {
    
    var firstView: ViewAlias? {
        return firstItem as? ViewAlias
    }
    
    var secondView: ViewAlias? {
        return secondItem as? ViewAlias
    }
    
    var firstAndSecondIsSame: Bool {
        return firstView == secondView
    }
    
    func firstAndSecondEqual(to view: ViewAlias) -> Bool {
        return firstAndSecondIsSame && (secondView == view)
    }
    
}

#if os(iOS) || os(tvOS)
    
    extension NSLayoutAttribute {
        
        var asString: String {
            switch self {
            case .left:
                return "left"
            case .right:
                return "right"
            case .top:
                return "top"
            case .bottom:
                return "bottom"
            case .leading:
                return "leading"
            case .trailing:
                return "trailing"
            case .width:
                return "width"
            case .height:
                return "height"
            case .centerX:
                return "centerX"
            case .centerY:
                return "centerY"
            case .lastBaseline:
                return "lastBaseline"
            case .firstBaseline:
                return "firstBaseline"
            case .leftMargin:
                return "leftMargin"
            case .rightMargin:
                return "rightMargin"
            case .topMargin:
                return "topMargin"
            case .bottomMargin:
                return "bottomMargin"
            case .leadingMargin:
                return "leadingMargin"
            case .trailingMargin:
                return "trailingMargin"
            case .centerXWithinMargins:
                return "centerXWithinMargins"
            case .centerYWithinMargins:
                return "centerYWithinMargins"
            case .notAnAttribute:
                return "notAnAttribute"
            }
        }
    }
    
#elseif os(OSX)
    
    extension NSLayoutConstraint.Attribute {
        
        var asString: String {
            switch self {
            case .left:
                return "left"
            case .right:
                return "right"
            case .top:
                return "top"
            case .bottom:
                return "bottom"
            case .leading:
                return "leading"
            case .trailing:
                return "trailing"
            case .width:
                return "width"
            case .height:
                return "height"
            case .centerX:
                return "centerX"
            case .centerY:
                return "centerY"
            case .lastBaseline:
                return "lastBaseline"
            case .firstBaseline:
                return "firstBaseline"
            case .notAnAttribute:
                return "notAnAttribute"
            }
        }
    }
    
#endif

