//
//  Array+StackView.swift
//  Modular
//
//  Created by Ondrej Rafaj on 03/12/2017.
//

import Foundation


#if os(iOS) || os(tvOS)
    
    extension Array where Element: ViewAlias {
        
        public var make: Make<[ViewAlias]> {
            return Make<[ViewAlias]>(self)
        }
        
    }
    
    
    extension Make where T == [ViewAlias] {
        
        public func horizontalStackView(distribution: UIStackViewDistribution = .equalSpacing, alignment: UIStackViewAlignment = .leading) -> UIStackView {
            let stackView = UIStackView(arrangedSubviews: element)
            stackView.axis = .horizontal
            stackView.distribution = distribution
            stackView.alignment = alignment
            return stackView
        }
        
        public func verticalStackView(distribution: UIStackViewDistribution = .equalSpacing, alignment: UIStackViewAlignment = .leading) -> UIStackView {
            let stackView = UIStackView(arrangedSubviews: element)
            stackView.axis = .vertical
            stackView.distribution = distribution
            stackView.alignment = alignment
            return stackView
        }
        
    }

#endif
