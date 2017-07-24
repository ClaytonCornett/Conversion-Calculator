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
    
    var choice: Int = 1
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        inputTextField.text = inputs[choice-1]
        outputTextField.text = outputs[choice-1]
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
        
    }
    

    var numbers: String = ""
    var unit: String = ""
    
    var inputs = ["Miles", "Kilometers", "Farenheight", "Celcius"]
    var outputs = ["Kilometers", "Miles", "Celcius", "Farenheight"]


    @IBAction func addNumber(_ sender: UIButton) {
      

        
        numbers = numbers + String(sender.tag-1)
        unit = inputs[choice-1]
    
        inputTextField.text = numbers + " " + unit
        
        switch choice {
        case 1:
            self.outputTextField.text = self.milesToKilometers(numbers)
        default:
            self.outputTextField.text = "default"
        }
    }
    
    var count = 0
    @IBAction func addDecimal(_ sender: UIButton) {
        
        if count == 0{
        numbers = numbers + "."
            inputTextField.text = numbers + " " + unit
            count = 1
        }
        
        
        
    }
    @IBAction func clearButton(_ sender: UIButton) {
        
        numbers = ""
        inputTextField.text = ""
        outputTextField.text = ""
        count = 0
    }
    

    @IBAction func plusminusChange(_ sender: UIButton) {
        
        if numbers == ""{
            return
        }
        
        if numbers == "." {
            return
        }
        
        var new: Double
        
        if let check = Double(numbers),
            check < 0{
            
            new = abs(check)
            numbers = String(new)
            
        }
        
        
            else{
                numbers = "-" + numbers
        }
        
        inputTextField.text = numbers + " " + unit
        
        switch choice {
        case 1:
            self.outputTextField.text = self.milesToKilometers(numbers)
        default:
            self.outputTextField.text = "default"
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
            
            
            self.choice = 1
            self.outputTextField.text = self.milesToKilometers(self.numbers)

            
            
        }))
        
        self.present(alert, animated: true, completion: nil)
    }
    
}

