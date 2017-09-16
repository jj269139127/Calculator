//
//  ViewController.swift
//  Calculator
//
//  Created by mac on 2017/9/6.
//  Copyright © 2017年 mac. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var labelResult: UILabel!
    
    var firstOperand: Double = 0.0
    var secondOperand: Double = 0.0
    var decimalPointFlag: Bool = false
    var isSecond: Bool = false
    var operatorFlag: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
//        self.view.backgroundColor = UIColor.yellow
//        let label = UILabel(frame: CGRect(x: 10, y: 170, width: 300, height: 50))
//        label.text = "欢迎来到iPhone应用程序开发的世界！"
//        label.textColor = UIColor.red
//        
//        self.view.addSubview(label)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func buttonTap(_ sender: UIButton) {
        if labelResult.text == "0" || (isSecond && secondOperand == 0.0) {
            labelResult.text = ""
        }
        labelResult.text = labelResult.text! + sender.titleLabel!.text!
        
        if isSecond {
            secondOperand = NSString(string:labelResult.text!).doubleValue
        }else {
            firstOperand = NSString(string:labelResult.text!).doubleValue
        }
    }
    
    @IBAction func decimalPointTap() {
        if !decimalPointFlag {
            labelResult.text = labelResult.text! + "."
            if  isSecond {
                secondOperand = NSString(string:labelResult.text!).doubleValue
            }else {
                firstOperand = NSString(string:labelResult.text!).doubleValue
            }
            decimalPointFlag = !decimalPointFlag
        }
    }
    @IBAction func operatorTap(_ sender: UIButton) {
        if firstOperand != 0 {
            isSecond = true
            decimalPointFlag = false
            
            switch sender.titleLabel!.text! {
            case "+":
                operatorFlag = "+"
            case "-":
                operatorFlag = "-"
            case "*":
                operatorFlag = "*"
            case "÷":
                operatorFlag = "/"
            default:
                operatorFlag = ""
            }
        }
    }
    @IBAction func resultTap() {
        if isSecond {
            if operatorFlag == "/" && secondOperand == 0 {
                print("除数不能为0.")
                return
            }
            var  result: Double = 0.0
            switch operatorFlag {
            case "+":
                result = firstOperand + secondOperand
            case "-":
                result = firstOperand - secondOperand
            case "*":
                result = firstOperand * secondOperand
            case "/":
                result = firstOperand / secondOperand
            default:
                result = 0
            }
            labelResult.text = result.description
        }
    }
    @IBAction func clear() {
        labelResult.text = "0"
        firstOperand = 0.0
        secondOperand = 0.0
        decimalPointFlag = false
        isSecond = false
        operatorFlag = ""
    }
}

