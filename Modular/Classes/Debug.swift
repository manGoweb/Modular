//
//  Debug.swift
//  Modular
//
//  Created by Ondrej Rafaj on 02/12/2017.
//

import Foundation


public struct Debug<T> {
    
    public enum DebugType {
        case simple
        case full
    }
    
    let element: T
    
    init(_ obj: T) {
        element = obj
    }
    
}


extension Debug where T: ViewAlias {
    
    public func constraints(debugType: DebugType = .simple) {
        guard let superview = element.superview else {
            Debug<T>.log("Impossible to debug, view has no superview")
            return
        }
        
        #if os(iOS) || os(tvOS)
            superview.setNeedsLayout()
            superview.layoutIfNeeded()
        #elseif os(OSX)
            superview.needsLayout = true
            superview.layout()
        #endif
        
        let address = addressHeap(element)
        
        func format(_ c: NSLayoutConstraint) -> String {
            guard debugType == .simple else {
                return c.description
            }
            
            if c.firstAndSecondEqual(to: element) {
                return "Internally \(c.firstAttribute.asString) relates to \(c.secondAttribute.asString)"
            }
            else if c.firstView == element {
                return c.firstAttribute.asString
            }
            else if c.secondView == element {
                return c.secondAttribute.asString
            }
            return "unknown"
        }
        
        var constraintInfo: Set<String> = []
        
        for c: NSLayoutConstraint in superview.constraints {
            guard c.firstItem as? T == element || c.secondItem as? T == element else {
                continue
            }
            constraintInfo.insert(format(c))
        }
        
        for c: NSLayoutConstraint in element.constraints {
            guard c.firstItem as? T == element || c.secondItem as? T == element else {
                continue
            }
            constraintInfo.insert(format(c))
        }
        
        // TODO: Print out all registered constraints
        var message = """

View memory address: \(address)
Current constraints:\n
"""
        for info in constraintInfo {
            message.append("\t- \(info)\n")
        }
        message.append("")
        Debug<T>.log(message)
    }
    
}


extension Debug {
    
    static func log(_ message: String) {
        print("Modular: \(message)")
    }
    
    func addressHeap<T: AnyObject>(_ o: T) -> String {
        let addr = unsafeBitCast(o, to: Int.self)
        return NSString(format: "%p", addr) as String
    }
    
}
