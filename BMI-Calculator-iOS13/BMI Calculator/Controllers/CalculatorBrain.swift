//
//  CalculatorBrain.swift
//  BMI Calculator
//
//  Created by Renzo on 2/10/2023.
//  Copyright © 2023 Angela Yu. All rights reserved.
//

import Foundation

struct CalculatorBrain {
    
    var bmi : BMI?
    
    func getBMIValue() -> String {
        let bmiToDecimal = String(format: "%.1f", bmi?.value ?? 0.0);
        return bmiToDecimal
    }
    
    mutating func calculateBMI(height: Float, weight: Float) {
        let calculatedBMI = weight / pow(height, 2)
        
        
        if(calculatedBMI < 18.5) {
            
            bmi = BMI(value: calculatedBMI, advice: "UNDERWEIGHT", color: .yellow)
            
        } else if (calculatedBMI > 24.9) {
            bmi = BMI(value: calculatedBMI, advice: "OVERWEIGHT", color: .red)
            
        } else {
            bmi = BMI(value: calculatedBMI, advice: "NORMAL", color: .blue)
            
        }
        
    }
    
}
