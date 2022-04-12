//
//  CalculatorLogic.swift
//  iOS Calculator
//
//  Created by Eetu Hernesniemi on 11.4.2022.
//

import Foundation

class CalculatorLogic {
    var number: Double
    
    init(number: Double) {
        self.number = number
    }
    
    func calculate(symbol: String) -> Double? {
            if symbol == "+/-" {
                return number * -1
            } else if symbol == "AC" {
                return 0
            } else if symbol == "%" {
                return number * 0.01
            }
        return nil
    }
}
