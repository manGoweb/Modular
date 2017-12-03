//
//  Modular.swift
//  Modular
//
//  Created by Ondrej Rafaj on 02/12/2017.
//

import Foundation

#if os(iOS) || os(tvOS)
    import UIKit
    
    public typealias ViewAlias = UIView
#elseif os(OSX)
    import Cocoa
    
    public typealias ViewAlias = NSView
#endif


public class Modular {
    
    public enum DebugMode {
        case disabled
        case enabled
    }
    
    public static var topMargin: CGFloat = 20
    public static var leftMargin: CGFloat = 20
    public static var rightMargin: CGFloat = -20
    public static var bottomMargin: CGFloat = -20
    
    public static var verticalSpacingMargin: CGFloat = 20
    public static var horizontalSpacingMargin: CGFloat = 20
    
    public static var debugMode: DebugMode = .enabled
    
}


public protocol PropertyProtocol {
    
    associatedtype PropertyParentType
    var place: Place<PropertyParentType> { get }
    var make: Make<PropertyParentType> { get }
    var debug: Debug<PropertyParentType> { get }

}

extension PropertyProtocol {
    
    public var place: Place<Self> {
        get {
            return Place(self)
        }
    }
    
    public var make: Make<Self> {
        get {
            return Make(self)
        }
    }
    
    public var debug: Debug<Self> {
        get {
            return Debug(self)
        }
    }
    
}

extension ViewAlias: PropertyProtocol { }
