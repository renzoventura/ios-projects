//
//  ExchangeModel.swift
//  ByteCoin
//
//  Created by Renzo on 4/10/2023.
//  Copyright © 2023 The App Brewery. All rights reserved.
//

import Foundation

//{
//  "time": "2023-10-03T06:39:12.0000000Z",
//  "asset_id_base": "BTC",
//  "asset_id_quote": "USD",
//  "rate": 27625.822258711416948597490143
//}
struct ExchangeModel : Codable {
    
    var asset_id_base: String
    var asset_id_quote: String
    var rate: Double
    
    init(asset_id_base: String, asset_id_quote: String, rate: Double) {
        self.asset_id_base = asset_id_base
        self.asset_id_quote = asset_id_quote
        self.rate = rate
    }
    
}

