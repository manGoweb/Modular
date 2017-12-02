//
//  Make.swift
//  Modular
//
//  Created by Ondrej Rafaj on 02/12/2017.
//

import Foundation


public struct Make<T> {
    
    let element: T
    
    init(_ obj: T) {
        element = obj
    }
    
    public var with: Make<T> {
        return self
    }
    
    public var make: Make<T> {
        return self
    }
    
    public var add: Make<T> {
        return self
    }
    
}
