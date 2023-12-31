//
//  ViewController.swift
//  ByteCoin
//
//  Created by Angela Yu on 11/09/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {

    
    @IBOutlet weak var bitcoinLabel: UILabel!
    @IBOutlet weak var currencyPicker: UIPickerView!
    @IBOutlet weak var currencyLabel: UILabel!
    
    @IBOutlet weak var messageLabel: UILabel!
    var coinManager = CoinManager();
    
    override func viewDidLoad() {
        super.viewDidLoad()
        messageLabel.text = ""
        currencyPicker.dataSource = self
        currencyPicker.delegate = self
        coinManager.delegate = self
        
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1;
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return coinManager.currencyArray.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return coinManager.currencyArray[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        coinManager.getCoinPrice(for: coinManager.currencyArray[row])

    }
    

    
}



extension ViewController: CoinManagerDelegate {
    func didUpdateExchangeRate(exchangeData: ExchangeModel) {
        
        DispatchQueue.main.async {
            self.messageLabel.text = ""

            self.currencyLabel.text = exchangeData.asset_id_quote
            self.bitcoinLabel.text = String(format: "%0.5f" ,exchangeData.rate)
        }
    }
    
    func didFailWithError(error: Error) {
        
        messageLabel.text = error.localizedDescription
        
    }
    
}
