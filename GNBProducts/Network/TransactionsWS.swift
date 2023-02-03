//
//  TransactionsWS.swift
//  GNBProducts
//
//  Created by Jaime Lucea on 31/1/23.
//

import Foundation

class TransactionsWS {
    
    //
    // Asynchronously gets transaction data from the server and executes the completion function afterwards
    //
    func getJSONData(completion: @escaping (Result<Data, Error>) -> Void) {
        
        guard let url = URL(string: URLConstants.TRANSACTIONS_WEBSERVICE_URL) else {
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
