//
//  ViewController.swift
//  iOS Calculator
//
//  Created by Eetu Hernesniemi on 17.9.2021.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var displayLabel: UILabel!
    
    private var isFinishedTypingNumber: Bool = true
    private var calculator = CalculatorLogic()
    
    private var displayValue: Double {
        get {
            guard let number = Double(displayLabel.text!) else {
                fatalError("Cannot convert display label text to a double.")
            }
            return number
        }
        set {
            displayLabel.text = String(newValue)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func calcButtonPressed(_ sender: UIButton) {
        isFinishedTypingNumber = true
        
        calculator.setNumber(displayValue)
        
        if let calcMethod = sender.currentTitle {
            if let result = calculator.calculate(symbol: calcMethod) {
                displayValue = result
            }
        }
    }
    
    @IBAction func numButtonPressed(_ sender: UIButton) {
        if let numValue = sender.currentTitle {
            if isFinishedTypingNumber {
                displayLabel.text = numValue
                isFinishedTypingNumber = false
            } else {
                if numValue == "." {
                    let isInt = floor(displayValue) == displayValue
                    
                    if !isInt {
                        return
                    }
                }
                displayLabel.text = displayLabel.text! + numValue
            }
        }
    }
    
}

