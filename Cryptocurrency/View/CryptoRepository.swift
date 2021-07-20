//
//  CryptocurrencyRepository.swift
//  Cryptocurrency
//
//  Created by Iulia Anisoi on 16.07.2021.
//

import Foundation

class CryptoRepository {
    let apiRequest = APIRequest()
    
    func getCryptoInfo(completion: @escaping (Result<Cryptocurrency, Error>) -> Void){
        self.apiRequest.fetchData { response in
            completion(response)
        }
    }
    
}
