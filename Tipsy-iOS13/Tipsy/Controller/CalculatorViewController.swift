//
//  ViewController.swift
//  Tipsy
//
//  Created by Angela Yu on 09/09/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class CalculatorViewController: UIViewController {

    //Outlets
    @IBOutlet weak var billTextField: UITextField!
    @IBOutlet weak var twentyPctButton: UIButton!
    @IBOutlet weak var zeroPctButton: UIButton!
    @IBOutlet weak var tenPctButton: UIButton!
    
    @IBOutlet weak var splitNumberLabel: UILabel!
    
    
    var currentPercent : Float = 0;
    var totalPerPerson : Float = 0;
    override func viewDidLoad() {
        super.viewDidLoad()
        resetAllButtons();
        currentPercent = 0.0;
        zeroPctButton.isSelected = true;
    }
    
    
    @IBAction func tipChanged(_ sender: UIButton) {
        resetAllButtons()
        billTextField.endEditing(true)
        let selected = sender.titleLabel?.text
        if(selected == "0%") {
            zeroPctButton.isSelected = true;
            currentPercent = 0.0;
        } else  if(selected == "10%") {
            tenPctButton.isSelected = true;
            
            currentPercent = 0.1;
        } else  {
            twentyPctButton.isSelected = true;
            
            currentPercent = 0.2;
        }
    }
    
    @IBAction func stepperValueChanged(_ sender: UIStepper) {
        splitNumberLabel.text = String(format: "%.0f", sender.value)
//        print(sender.value)
    }
    
    @IBAction func calculatePressed(_ sender: Any) {
//        print(splitNumberLabel.text!)
        print(billTextField.text ?? "0")
        let billAmount = Float(billTextField.text!) ?? 0.0
        let tipAmount = billAmount * (currentPercent)
        let total = billAmount + tipAmount
        totalPerPerson = Float(total) / (Float(splitNumberLabel.text!) ?? 1)
        
        self.performSegue(withIdentifier: "goToResult", sender: nil)
    }
    
    func resetAllButtons() {
        tenPctButton.isSelected = false;
        twentyPctButton.isSelected = false;
        zeroPctButton.isSelected = false;
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToResult" {

            let resultController = segue.destination as! ResultsViewController
//            resultController.settingText = "Split between " + (splitNumberLabel.text ?? "") + " people, with " + String(Int(currentPercent)); +"% tip.";
            resultController.settingText = "Split between \(splitNumberLabel.text!) people, with \(String(Int(currentPercent)))% tip."
            
            
            
            resultController.totalText = "$" + String(format: "%.2f", totalPerPerson)
        } else {
            print("Cannot find segue identifier")
        }
    }

}

