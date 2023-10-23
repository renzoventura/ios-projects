//
//  ResultsViewController.swift
//  Tipsy
//
//  Created by Renzo on 2/10/2023.
//  Copyright © 2023 The App Brewery. All rights reserved.
//

import UIKit

class ResultsViewController: UIViewController {


    var settingText : String?
    var totalText : String?
    
    @IBOutlet weak var settingsLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        settingsLabel.text = settingText;
        totalLabel.text = totalText;
        
//        settingsLabel.text = " lo"

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

    @IBAction func recalculatePressed(_ sender: UIButton) {
        
        self.dismiss(animated: true)
    }

}
