//
//  Array+StackView.swift
//  Modular
//
//  Created by Ondrej Rafaj on 03/12/2017.
//

import Foundation


#if os(iOS) || os(tvOS)
    

    public extension Array where Element: UIView {
        
        var make: MakeViewArray {
            return MakeViewArray(elements: self)
        }
        
    }

    public struct MakeViewArray {
        
        let elements: [ViewAlias]
        
        public func horizontalStackView(distribution: UIStackViewDistribution = .equalSpacing, alignment: UIStackViewAlignment = .leading) -> UIStackView {
            let stackView = UIStackView(arrangedSubviews: elements)
            stackView.axis = .horizontal
            stackView.distribution = distribution
            stackView.alignment = alignment
            return stackView
        }
        
        public func verticalStackView(distribution: UIStackViewDistribution = .equalSpacing, alignment: UIStackViewAlignment = .leading) -> UIStackView {
            let stackView = UIStackView(arrangedSubviews: elements)
            stackView.axis = .vertical
            stackView.distribution = distribution
            stackView.alignment = alignment
            return stackView
        }
        
    }


#endif
