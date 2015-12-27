//
//  ViewController.swift
//  Calculator
//
//  Created by arnav.gudibande on 12/25/15.
//  Copyright © 2015 Arnav Gudibande. All rights reserved.
//

import UIKit
import Darwin

class ViewController: UIViewController
{

    @IBOutlet weak var Display: UILabel!
    
    var userIsInTheMiddleOfTypingANumber = false
    
    var brain = CalculatorBrain()
    
    @IBAction func appendDigit(sender: UIButton) {
        let digit = sender.currentTitle!
        if userIsInTheMiddleOfTypingANumber {
            Display.text = Display.text! + digit
        } else {
            Display.text = digit
            userIsInTheMiddleOfTypingANumber = true
        }
        print("digit = \(digit)")
    }
    
    @IBAction func operate(sender: UIButton) {
        if userIsInTheMiddleOfTypingANumber{
            enter()
        }
        if let operation = sender.currentTitle{
            if let result = brain.performOperation(operation){
                displayValue = result
            } else {
                displayValue = 0
            }
            
        }
        
    }

    
    @IBAction func enter() {
        userIsInTheMiddleOfTypingANumber = false
        if let result = brain.pushOperand(displayValue){
            displayValue = result
        } else {
            displayValue = 0
        }
    }
    
    var displayValue: Double {
        get {
            return NSNumberFormatter().numberFromString(Display.text!)!.doubleValue
        }
        set {
            Display.text = "\(newValue)"
            userIsInTheMiddleOfTypingANumber = false
        }
    }

}

