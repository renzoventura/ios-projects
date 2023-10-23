//
//  CoinManager.swift
//  ByteCoin
//
//  Created by Angela Yu on 11/09/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import Foundation

protocol CoinManagerDelegate {
    func didUpdateExchangeRate(exchangeData: ExchangeModel)
    func didFailWithError(error: Error)
}

struct CoinManager {
    
    var delegate: CoinManagerDelegate? //
    
    let baseURL = "https://rest.coinapi.io/v1/exchangerate/BTC"
    let apiKey = "01A4AAC3-3F92-4031-BDEC-F0B2C0AB27B6"
    let session = URLSession.shared

    let currencyArray = ["AUD", "BRL","CAD","CNY","EUR","GBP","HKD","IDR","ILS","INR","JPY","MXN","NOK","NZD","PLN","RON","RUB","SEK","SGD","USD","ZAR"]

    
    func getCoinPrice(for currency: String) {
        
        let urlString = "\(baseURL)/\(currency)?apikey=\(apiKey)";
        performRequest(urlString: urlString);
    }
    
    func performRequest(urlString: String) {
        if let url = URL(string: urlString ) {
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: url) {
                (data, response, error) in
                if error != nil {
                    self.delegate?.didFailWithError(error: error!)
                    return
                }
                if let safeData = data {
                    if let exchange = self.parseJSON(exchangeData: safeData) {
                        print(exchange.asset_id_quote)
                        print(exchange.rate)
                        self.delegate?.didUpdateExchangeRate(exchangeData: exchange)
                    }
                }
            }
            task.resume(); //4. Start the task
        }
    }
    
    func parseJSON(exchangeData: Data) -> ExchangeModel?  {
        let decoder = JSONDecoder()
        do {
            let decoded = try decoder.decode(ExchangeModel.self, from: exchangeData)
            return decoded;
        } catch {
            print("Something went wrong!");
        }
        return nil;
    }
    
    
    
    
    
    
    
    
//https://rest.coinapi.io/v1/exchangerate/BTC/USD
//  --header "X-CoinAPI-Key: 01A4AAC3-3F92-4031-BDEC-F0B2C0AB27B6"
//MY API KEY:

//https://rest.coinapi.io/v1/exchangerate/BTC/USD?apikey=01A4AAC3-3F92-4031-BDEC-F0B2C0AB27B6
}
