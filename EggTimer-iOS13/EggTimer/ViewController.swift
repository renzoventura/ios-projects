//
//  ViewController.swift
//  EggTimer
//
//  Created by Angela Yu on 08/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    let softTime = 5
    let mediumTime = 10
    let hardTime = 15
    
    var newTimer = Timer();
    
    var totalTime = 0
    var secondsPassed = 0

    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var progressView: UIProgressView!
    
    @IBAction func hardnessSelected(_ sender: UIButton) {
        newTimer.invalidate();
        progressView.progress = 1.0
        let hardness = sender.currentTitle ?? "Soft";
        
        let softness = ["Soft": softTime,
                        "Medium": mediumTime,
                        "Hard": hardTime]

        totalTime = softness[hardness]!

        newTimer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateCounter), userInfo: nil, repeats: true)
    }
    
    
    @objc func updateCounter() {
        //example functionality
        if totalTime > 0 {
            print("\(totalTime) seconds")
            secondsPassed += 1
 
            progressView.progress = Float(secondsPassed) / Float(totalTime)
            
            print()
        }
        if(totalTime == 0) {
            newTimer.invalidate();
            titleLabel.text = "Done!";
        }
    }
}

