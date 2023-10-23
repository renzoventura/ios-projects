//
//  ResultsViewController.swift
//  BMI Calculator
//
//  Created by Renzo on 2/10/2023.
//  Copyright © 2023 Angela Yu. All rights reserved.
//

import UIKit

class ResultsViewController: UIViewController {

    var bmiValue : BMI?
    
    @IBOutlet weak var background: UIImageView!
    @IBOutlet weak var adviceLabel: UILabel!
    @IBOutlet weak var bmiLabel: UILabel!
    @IBOutlet weak var advicelabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        bmiLabel.text = String(format: "%.2f", bmiValue?.value ?? 0.0)
        advicelabel.text = bmiValue?.advice
        background.backgroundColor = bmiValue?.color
    }
    

    @IBAction func onRecalculatePressed(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)

    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
