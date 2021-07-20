//
//  Cryptocurrency.swift
//  Cryptocurrency
//
//  Created by Iulia Anisoi on 16.07.2021.
//

import Foundation

struct Cryptocurrency: Decodable {
    let data: [CoinData?]
    let info: CoinInfo?
}

struct CoinData: Decodable {
    let id, symbol, name, nameid: String?
    let rank: Int?
    let priceUsd, percentChange7D: String?
    let priceBtc: String?
}

struct CoinInfo: Decodable {
    let coinsNum, time: Int?
}

extension CoinData: CustomStringConvertible {
    var description: String {
        let priceUsdInt = Double(priceUsd ?? "0")
        var formattedValue = String(format: "%.2f", priceUsdInt!)
        
        while formattedValue.last == "0" {
            formattedValue.removeLast()
        }
        
        if formattedValue.last == "." {
            formattedValue.removeLast()
        }
        
        return "\(formattedValue)"
    }
}
