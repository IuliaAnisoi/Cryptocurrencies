//
//  APIRequest.swift
//  Cryptocurrency
//
//  Created by Iulia Anisoi on 16.07.2021.
//

import Foundation

class APIRequest {
    
    func fetchData(completionHandler: @escaping (Result<Cryptocurrency, Error>) -> ()) {
        
            guard let url = URL(string: "https://api.coinlore.net/api/tickers/?start=100&limit=100") else { return }
            let session = URLSession.shared
            let request = URLRequest(url: url)

            let task = session.dataTask(with: request as URLRequest){ (data: Data?, response: URLResponse?, error: Error?) -> Void in
            guard let data = data else { return }
            
            do {
                let decoder = JSONDecoder()
                decoder.keyDecodingStrategy = .convertFromSnakeCase
                let result = try decoder.decode(Cryptocurrency.self, from: data)
                completionHandler(.success(result))
            }
            catch let error {
                print(error.localizedDescription)
                completionHandler(.failure(error))
            }
            
        }
        task.resume()
    }
    
}
