//
//  Calculations.swift
//  Calculator
//
//  Created by CS Guy on 1/2/19.
//  Copyright © 2019 CS Guy. All rights reserved.
//

import Foundation


func calculate (input: String) -> NSNumber {
    
    let expression = NSExpression(format: input)

    let result = expression.expressionValue(with: nil, context: nil) as! NSNumber
    return result
}
