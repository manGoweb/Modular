//
//  Place.swift
//  Nimble
//
//  Created by Ondrej Rafaj on 02/12/2017.
//

import Foundation
#if os(iOS) || os(tvOS)
    import UIKit
#elseif os(OSX)
    import Cocoa
#endif

public struct Place<T> {
    
    let element: T
    
    init(_ obj: T) {
        element = obj
    }
    
}
