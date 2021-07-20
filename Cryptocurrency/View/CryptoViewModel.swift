//
//  CryptocurrencyViewModel.swift
//  Cryptocurrency
//
//  Created by Iulia Anisoi on 16.07.2021.
//

import Foundation
import RxSwift


public class CryptoViewModel {
    let currenciesObservable = PublishSubject<[CoinData]>()
    var currencies: [CoinData] = []
    let cryptoRepository = CryptoRepository()
    
    func getCryptoInfo() {
        cryptoRepository.getCryptoInfo { [weak self] result in
            guard let self = self else { return }
            switch result {
            case .success(let currency):
                self.currencies = currency.data.filter{$0 != nil }.map {$0!}// [currency.data]
                self.currenciesObservable.onNext(self.currencies)
                
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
}
