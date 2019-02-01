//
//  ViewController.swift
//  IOS Calculator
//
//  Created by ZOG-II on 2019-02-01.
//  Copyright © 2019 Jonatan Vahlberg. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var outputLbl: UILabel!
    @IBOutlet weak var clearButton: UIButton!
    var startNewEquation : Bool = false
    var isLeftNumber : Bool = true
    
    var equationString : String = ""
    var oldLeftNumberString = ""
    var leftNumberString : String = ""
    var rightNumberString : String = ""
    var operand : Int = 0
    var operandChar : Character = "+"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector (tap))
        let longGesture = UILongPressGestureRecognizer(target: self, action: #selector (long))
        
        clearButton.addGestureRecognizer(tapGesture)
        clearButton.addGestureRecognizer(longGesture)

    }

    
    
    @IBAction func inputNumber(_ sender: UIButton) {
        if startNewEquation{
            startNewEquation = false
            leftNumberString = String(sender.tag)
            setEquationString(first: leftNumberString)
        }
        else if(isLeftNumber){
            leftNumberString = leftNumberString + String(sender.tag)
            setEquationString(first: leftNumberString)
        }
        else{
            rightNumberString = rightNumberString + String(sender.tag)
            if(oldLeftNumberString.isEmpty){
                setEquationString(first: leftNumberString, operand: String(operandChar), second: rightNumberString)
            }
            else{
                setEquationString(first: oldLeftNumberString, operand: String(operandChar), second: rightNumberString)
            }
            
            
        }
        
        outputLbl.text = equationString
        
    }
    
    @IBAction func inputOperand(_ sender: UIButton){
        if(startNewEquation){
            startNewEquation = false
        }
        
        if(leftNumberString.isEmpty){
            return
        }
        else if(rightNumberString.isEmpty){
            isLeftNumber = false
            operand = sender.tag
            operandChar = Character(sender.currentTitle!)
            
            setEquationString(first: leftNumberString, operand: String(operandChar), second: rightNumberString)
            
            
        }
        else{
            isLeftNumber = false
            
            operandChar = Character(sender.currentTitle!)
            if equationCheck(){
                asignLeftNumber()
                rightNumberString = ""
                setEquationString(first: oldLeftNumberString, operand: String(operandChar), second: rightNumberString)
            }
            operand = sender.tag
            
            
            
        }
        
        outputLbl.text = equationString
        
    }
    
    @IBAction func inputDecimalPoint(_ sender: UIButton) {
        if(isLeftNumber){
            if(leftNumberString.count > 0 && !leftNumberString.contains(".")){
                leftNumberString = leftNumberString + "."
                equationString = leftNumberString
            }
            
        }
        else{
            if(rightNumberString.count > 0 && !rightNumberString.contains(".")){
                rightNumberString = rightNumberString + "."
                setEquationString(first: leftNumberString, operand: String(operandChar), second: rightNumberString)
                
            }
            
        }
        
        outputLbl.text = equationString
        
    }
    func asignLeftNumber(){
        switch operand{
        case 0:
            break
        case 1:
            leftNumberString = String( Double(leftNumberString)! + Double(rightNumberString)!)
            break
        case 2:
            leftNumberString = String( Double(leftNumberString)! - Double(rightNumberString)!)
            break
        case 3:
            leftNumberString = String( Double(leftNumberString)! * Double(rightNumberString)!)
        case 4:
            leftNumberString = String( Double(leftNumberString)! / Double(rightNumberString)!)
            break
        case 5:
            leftNumberString = String( Double(leftNumberString)!.truncatingRemainder(dividingBy: Double(rightNumberString)!))
            break
        default:
            break
        }
        oldLeftNumberString = equationString
    }
    @IBAction func equate(_ sender: UIButton) {
        if(leftNumberString.isEmpty){
            return
        }
        else if(rightNumberString.isEmpty){
            outputLbl.text = leftNumberString
        }
        else{
            if equationCheck(){
                
                asignLeftNumber()
                outputLbl.text = leftNumberString
            }
        }
        finishEquation()
            
    }
    
    func equationCheck()-> Bool {
        
        return true
    }
    func finishEquation(){
        isLeftNumber = true
        rightNumberString = ""
        startNewEquation = true
        oldLeftNumberString = ""
    }
    
    func setEquationString(first: String,operand: String, second: String){
        
        equationString = first + " \(operand) " + second
    }
    func setEquationString(first: String){
        equationString = first
    }
    
    
   @objc func tap(){
        if(isLeftNumber){
            if !leftNumberString.isEmpty{
                leftNumberString.remove(at: leftNumberString.index(of: leftNumberString.last!)!)
                setEquationString(first: leftNumberString)
            }
        }
        else{
            if(!rightNumberString.isEmpty){
                rightNumberString.remove(at: rightNumberString.index(of: rightNumberString.last!)!)
                if(oldLeftNumberString.isEmpty){
                    setEquationString(first: leftNumberString, operand: String(operandChar), second: rightNumberString)
                }else{
                    setEquationString(first: oldLeftNumberString, operand: String(operandChar), second: rightNumberString)
                }
                    
            }
        
            else{
                if(oldLeftNumberString.isEmpty){
                    isLeftNumber = true
                    setEquationString(first: leftNumberString)
                    }
                else{
                    setEquationString(first: oldLeftNumberString)
                }
            }
        }
    outputLbl.text = equationString
    }
   @objc func long(){
        equationString = ""
        leftNumberString = ""
        rightNumberString = ""
        oldLeftNumberString = ""
        isLeftNumber = true
        startNewEquation = false
        outputLbl.text = "0"
    }
    
    
}

