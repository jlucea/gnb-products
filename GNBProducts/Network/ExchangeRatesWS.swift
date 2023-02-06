//
//  ExchangeRatesWS.swift
//  GNBProducts
//
//  Created by Jaime Lucea on 6/2/23.
//

import Foundation

class ExchangeRatesWS {
    
    //
    // Asynchronously gets transaction data from the server and executes the completion function afterwards
    //
    func getJSONData(completion: @escaping (Result<Data, Error>) -> Void) {
        
        guard let url = URL(string: URLConstants.EXCHANGE_RATES_WEBSERVICE_URL) else {
            completion(.failure(URLError(.badURL)))
            return
        }

        URLSession.shared.dataTask(with: url) { (data, response, error) in
            if let error = error {
              completion(.failure(error))
            } else if let data = data {
              completion(.success(data))
            }
        }.resume()
    }
    
}
