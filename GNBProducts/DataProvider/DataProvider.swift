//
//  DataProvider.swift
//  GNBProducts
//
//  Created by Jaime Lucea on 6/2/23.
//

import Foundation

//
// This class provides data to the rest of the app, requesting it to the WS if needed
//
class DataProvider {
    
    // Singleton pattern
    static let shared = DataProvider()
    
    private var transactions : [Transaction]?
    
    private init() {}
    
    func getTransactions(completion: @escaping (Result<[Transaction], Error>) -> Void) {
        if transactions?.isEmpty == false {
            // Return transactions stored in memory
            print("Recovering transaction data from memory")
            completion(.success(transactions!))
            
        } else {
            // Call web service
            print("Requesting transactions to webservice")
            fetchTransactions(completion: completion)
        }
    }
    
    private func fetchTransactions(completion: @escaping (Result<[Transaction], Error>) -> Void) {
        // Call web service
        TransactionsWS().getJSONData { (result) in
            switch result {
                case .success(let data):
                    // Data from web service received
                    print("Transaction data received from API")
                    if let transactions : [Transaction] = TransactionDataTransformer().transform(transactionDataJSON: data) {
                        // Published data is uptaded in the main thread
                        DispatchQueue.main.async { () -> Void in
                            self.transactions = transactions
                            completion(.success(transactions))
                        }
                    }
                case .failure(let error):
                    print(error.localizedDescription)
                    completion(.failure(error))
            }
        }
    }
    
    
    
    
}
