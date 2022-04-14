//
//  CalculatorLogic.swift
//  iOS Calculator
//
//  Created by Eetu Hernesniemi on 11.4.2022.
//

import Foundation

struct CalculatorLogic {
    private var number: Double?
    
    private var intermediateCalculation: (n1: Double, calcMethod: String)?
    
    mutating func setNumber(_ number: Double) {
        self.number = number
    }
    
    mutating func calculate(symbol: String) -> Double? {
        if let n = number {
            var result : Double?
            switch symbol {
            case "+/-":
                result = n * -1
            case "AC":
                result = 0
            case "%":
                result = n * 0.01
            case "=":
                result = performTwoNumCalculation(n2: n)
            default:
                intermediateCalculation = (n1: n, calcMethod: symbol)
            }
            if let safeResult : Double = result {
                return roundCalcResult(n: safeResult)
            }
        }
        return nil
    }
    
    private func performTwoNumCalculation(n2: Double) -> Double? {
        if let n1 = intermediateCalculation?.n1
            , let operation = intermediateCalculation?.calcMethod {
            
            switch operation {
            case "+":
                return n1 + n2
            case "-":
                return n1 - n2
            case "×":
                return n1 * n2
            case "÷":
                if n2 == 0 {
                    return nil
                }
                return n1/n2
            default:
                fatalError("Operation failure in calculation.")
            }
        }
        return nil
    }
    
    private func roundCalcResult(n: Double) -> Double{
        return Double(round(1000 * n) / 1000)
    }
}
