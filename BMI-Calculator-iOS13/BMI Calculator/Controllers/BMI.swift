//
//  BMI.swift
//  BMI Calculator
//
//  Created by Renzo on 2/10/2023.
//  Copyright © 2023 Angela Yu. All rights reserved.
//

import UIKit

struct BMI {
    var value: Float
    let advice: String
    let color: UIColor
    
    init(value: Float, advice: String, color: UIColor) {
        self.value = value
        self.advice = advice
        self.color = color
    }
    
}
