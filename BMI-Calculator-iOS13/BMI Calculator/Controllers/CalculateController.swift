//
//  ViewController.swift
//  BMI Calculator
//
//  Created by Angela Yu on 21/08/2019.
//  Copyright © 2019 Angela Yu. All rights reserved.
//

import UIKit

class CalculateController: UIViewController {
    
    var calculatorBrain = CalculatorBrain();
    
    @IBOutlet weak var weightValue: UISlider!
    @IBOutlet weak var weightLabel: UILabel!
    @IBOutlet weak var heightLabel: UILabel!
    @IBOutlet weak var heightValue: UISlider!
    
    var bmiValue : String? ;
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func onHeightSliderChange(_ sender: UISlider) {
        heightLabel.text = String(format:"%.2f", sender.value) + "m"
    }
    
    @IBAction func onWeightSliderChange(_ sender: UISlider) {
        weightLabel.text = String(Int(sender.value)) + "Kg"
        
    }
    
    @IBAction func calculatePressed(_ sender: UIButton) {
        let weight = weightValue.value
        let height = heightValue.value
        calculatorBrain.calculateBMI(height: height, weight: weight)
        self.performSegue(withIdentifier: "goToResult", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToResult" {
            let destinationVC = segue.destination as! ResultsViewController
            destinationVC.bmiValue = calculatorBrain.bmi
            
            
        }
    }
}

