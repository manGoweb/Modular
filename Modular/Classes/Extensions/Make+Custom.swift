//
//  Make+Custom.swift
//  Modular
//
//  Created by Ondrej Rafaj on 03/06/2018.
//  Copyright © 2018 manGoweb UK. All rights reserved.
//

import Foundation
#if os(iOS) || os(tvOS)
@_exported import UIKit
#elseif os(OSX)
@_exported import Cocoa
#endif
@_exported import SnapKit


extension Make where T: ViewAlias {
    
    /**
     Make any additional custom modifications
     
     - parameters:
        - closure: SnapKit's make closure
     - returns: `Make` instance to allow further modifications
     */
    @discardableResult public func custom(_ closure: (ConstraintMaker) -> Void) -> Make<T> {
        element.snp.makeConstraints { (make) in
            closure(make)
        }
        return self
    }

}
