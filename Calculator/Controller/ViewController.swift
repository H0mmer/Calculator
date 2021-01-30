//
//  ViewController.swift
//  Calculator
//
//  Created by H0mmer on 24/01/2021.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet var resultLbl: UILabel!
    @IBOutlet var currentNumbersLbl: UILabel!
    
    var result:Double = 0
    var firstNumber:Double = 0
    var secondNumber: Double = 0
    var displayNumber:Double = 0
    var operationPerform:Bool = false
    var operationSelected = ""

    override func viewDidLoad() {
      
        resultLbl.text = "0"
        currentNumbersLbl.text = "0"

    }

    @IBAction func numbers(_ sender: UIButton) {
        
        numberSelected(number: sender)
        
    }
    
    @IBAction func operations(_ sender: UIButton) {
        
        operation(operation: sender)
        
    }
    
    func numberSelected(number: UIButton) {  // Selected number and show on LBL
        
        if resultLbl.text == "0" {
            resultLbl.text = ""
        }
        
        if operationPerform == true {
        resultLbl.text = String(number.tag - 1)
        displayNumber = Double(resultLbl.text!)!
        operationPerform = false

        } else {
            resultLbl.text = resultLbl.text! + String(number.tag - 1)
            displayNumber = Double(resultLbl.text!)!
           
        }
        
    }
    
    func operation(operation: UIButton) { // Check which button -> tag was selected and trigger propper                                      // operation
        let tag = operation.tag

        if tag !=  11 && tag != 16 && tag != 17 && tag != 18 && tag != 19 && tag != 20 {
           
            if tag == 12 && firstNumber == 0 { //Add
                operationTrue()
                operationSelected = "+"
                
            } else if tag == 12 {
                operationFalse()
                operationSelected = "+"
                
            } else if tag == 14 && firstNumber == 0 { //Multiply
                operationTrue()
                operationSelected = "*"
                
            } else if tag == 14 {
                operationFalse()
                operationSelected = "*"
                
            } else if tag == 15 && firstNumber == 0 { //Devide
               operationTrue()
                operationSelected = "/"
                
            } else if tag == 15 {
                operationFalse()
                operationSelected = "/"
                
            } else if tag == 13 && firstNumber == 0 { // Substract
                operationTrue()
                operationSelected = "-"
                
            } else if tag == 13 {
                operationFalse()
                operationSelected = "-"
            }
            
        } else if tag == 16 { // Clear all
            resultLbl.text = "0"
            currentNumbersLbl.text = ""
            operationPerform = false
            firstNumber = 0
            secondNumber = 0
            result = 0
            
        } else if tag == 11 { // Equal to
            
            if  operationSelected == "+" { // Add
                operationView()
                result = firstNumber + secondNumber
                resultLbl.text = String(result)
                
            } else if operationSelected == "*" { // Multiply
                operationView()
                result = firstNumber * secondNumber
                resultLbl.text = String(result)
                
            } else if operationSelected == "/" { // Devide
                operationView()
                result = firstNumber / secondNumber
                resultLbl.text = String(result)
                
            } else if operationSelected == "-" { // Substract
                operationView()
                result = firstNumber - secondNumber
                resultLbl.text = String(result)

            }
        } else if tag == 17 { // Change prefix +/-
            let number = Double(resultLbl.text!)!
                if number.sign == .minus {
                    resultLbl.text = "\(+number)"
                    displayNumber = +number
                } else {
                    resultLbl.text = "\(-number)"
                    displayNumber = -number
                }

        } else if tag == 18 {
            let number = Double(resultLbl.text!)!
            let calc = number * 0.01
            resultLbl.text = "\(calc)"
            displayNumber = calc
            
        } else if tag == 19 {
            var number = resultLbl.text
            if number!.count > 1{
                number?.removeLast()
                resultLbl.text = number
                displayNumber = Double(number!)!
            } else {
                resultLbl.text = "0"
                displayNumber = 0
            }
        } else if tag == 20 {
            var number = resultLbl.text
            number?.append(".")
            resultLbl.text = number
        }
        
    }
    
    func operationView() {
        secondNumber = displayNumber
        currentNumbersLbl.text! += "\(operationSelected)" + "\(secondNumber)"
        operationPerform = false
        operationSelected = ""
    }
    
    func operationTrue() {
        operationPerform = true
        firstNumber = displayNumber
        currentNumbersLbl.text = String(firstNumber)
    }
            
    func operationFalse() {
        operationPerform = false
        secondNumber = displayNumber
    }
 
}


