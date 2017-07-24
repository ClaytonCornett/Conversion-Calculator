//
//  ViewController.swift
//  Conversion Calculator
//
//  Created by Clayton Cornett on 7/23/17.
//  Copyright © 2017 Clayton Cornett. All rights reserved.
//

import UIKit


class ViewController: UIViewController {

    @IBOutlet weak var inputTextField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func addNumber(_ sender: UIButton) {
        
        inputTextField.text = inputTextField.text! + String(sender.tag-1)
    }
    
    var count = 0
    @IBAction func addDecimal(_ sender: UIButton) {
        
        if count == 0{
        inputTextField.text = inputTextField.text! + "."
            count = 1
        }
        
        
        
    }
    @IBAction func clearButton(_ sender: UIButton) {
        
        inputTextField.text = ""
        count = 0
    }
    var isOn = false

    @IBAction func plusminusChange(_ sender: UIButton) {
        
            if isOn == true {
  //              String(dropFirst(inputTextField.text))
                
        }
        
            else{
                inputTextField.text = "-" + inputTextField.text!
        }
    }
}

