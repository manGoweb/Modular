//
//  Modular.swift
//  Modular
//
//  Created by Ondrej Rafaj on 02/12/2017.
//

import Foundation

#if os(iOS) || os(tvOS)
    @_exported import UIKit
    
    /// Alias for view available on current platform (iOS, tvOS)
    public typealias ViewAlias = UIView
#elseif os(OSX)
    @_exported import Cocoa
    
    /// Alias for view available on current platform (macOS)
    public typealias ViewAlias = NSView
#endif


/**
 Base configuration class used to set default margins throughout the project.
 
 You will still be able to set custom margings directly where applicable if needed
 */
public class Modular {
    
    /// Top margin, only used on spacing towards superview, when chaining multiple views below each other, verticalSpacingMargin will be used instead by default
    public static var topMargin: CGFloat = 20
    
    /// Left margin, used for side spacing to superview, when chaining multiple views next to each other, horizontalSpacingMargin will be used instead by default
    public static var leftMargin: CGFloat = 20
    
    /// Right margin, used for side spacing to superview, when chaining multiple views next to each other, horizontalSpacingMargin will be used instead by default
    public static var rightMargin: CGFloat = -20
    
    /// Bottom margin, only used on spacing towards superview
    public static var bottomMargin: CGFloat = -20
    
    /// Used to space items horizontaly (placing them next or before each other)
    public static var horizontalSpacingMargin: CGFloat = 20
    
    /// Used to space items vertically (placing them below or above each other)
    public static var verticalSpacingMargin: CGFloat = 20
    
}

/**
 Protocol allowing access to the Modular methods
 */
public protocol PropertyProtocol {
    
    associatedtype PropertyParentType
    var place: Place<PropertyParentType> { get }
    var make: Make<PropertyParentType> { get }
    var debug: Debug<PropertyParentType> { get }

}

extension PropertyProtocol {
    
    // MARK: Modular properties for views
    
    /// Place a view on stage
    public var place: Place<Self> {
        get {
            return Place(self)
        }
    }
    
    /// Additional layout helpers
    public var make: Make<Self> {
        get {
            return Make(self)
        }
    }
    
    /// Debug your views constraints easy
    public var debug: Debug<Self> {
        get {
            return Debug(self)
        }
    }
    
}

extension ViewAlias: PropertyProtocol { }
