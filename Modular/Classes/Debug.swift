//
//  Debug.swift
//  Modular
//
//  Created by Ondrej Rafaj on 02/12/2017.
//

import Foundation


public struct Debug {
    
    let element: Any
    
    init(_ obj: Any) {
        element = obj
    }
    
    static var debugInfo: [Int: [String]]?
    
}


extension Debug {
    
    static func log(_ message: String) {
        print("Modular: \(message)")
    }
    
    // TODO: Fix or remove!
    static func add(constraint: String, for object: AnyObject) {
        if Modular.debugMode == .enabled {
            let ptr = Unmanaged.passRetained(object).toOpaque()
            let nullPtr = UnsafeRawPointer(bitPattern: 0)
            guard let address = nullPtr?.distance(to: ptr) else {
                log("Unable to find objects pointer")
                return
            }
            
            if debugInfo == nil {
                log("Starting debug")
                debugInfo = [:]
            }
            
            var info: [String] = debugInfo![address] ?? []
            info.append(constraint)
            debugInfo![address] = info
            
            log("Added `\(constraint)` for \(address)")
        }
    }
    
}
