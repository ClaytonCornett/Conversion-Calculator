//
//  ViewController.swift
//  Conversion Calculator
//
//  Created by Clayton Cornett on 7/23/17.
//  Copyright © 2017 Clayton Cornett. All rights reserved.
//

import UIKit


class ViewController: UIViewController {

    @IBOutlet weak var outputTextField: UITextField!
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
    

    @IBAction func plusminusChange(_ sender: UIButton) {
        
        var new: Double
        
        if let check = Double(inputTextField.text!),
            check < 0{
            
            new = abs(check)
            inputTextField.text = String(new)
            
        }
        
        
            else{
                inputTextField.text = "-" + inputTextField.text!
        }
    }
    
    
    func milesToKilometers(_ miles: String) -> String {
        
        let new: Double = Double(miles)!
        let multiplier: Double = 1.6
        
        let total = new * multiplier
        
        return String(total) + " Kilometers"
        
    }
    
    
    @IBAction func converterButton(_ sender: AnyObject) {
        
        let alert = UIAlertController(title: "Choose a Converter", message: "", preferredStyle: UIAlertControllerStyle.actionSheet)
        alert.addAction(UIAlertAction(title: "Miles to Kilometers", style: UIAlertActionStyle.default, handler: {
            (alertAction) -> Void in
            
            
            
            self.outputTextField.text = self.milesToKilometers(self.inputTextField.text!)
            
            
        }))
        
        self.present(alert, animated: true, completion: nil)
    }
    
}

