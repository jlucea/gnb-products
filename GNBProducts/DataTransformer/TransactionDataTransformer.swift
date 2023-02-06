//
//  DataTransformer.swift
//  GNBProducts
//
//  Created by Jaime Lucea on 6/2/23.
//

import Foundation

class TransactionDataTransformer {
    
    //
    // Parses an Array of Transactions from a JSON formatted data block
    //
    func transform(transactionDataJSON: Data) -> [Transaction]? {
        do {
            let transactions = try JSONDecoder().decode([Transaction].self, from: transactionDataJSON)

            print("\(transactions.count) transactions decoded")
            return transactions
            
        } catch {
            print("JSON decoding error")
            return nil
        }
    }
    
    //
    // Returns the set of unique products contained in an array of transactions
    //
    func transform(transactions: [Transaction]) -> [Product] {
        if transactions.isEmpty == false {
            let uniqueProductNames = Set(transactions.map({$0.sku}))
            return uniqueProductNames.map {Product(name: $0)}
        }else{
            return []
        }
    }
    
    //
    // Decodes an array of products from a JSON formatted data block
    //
    func transform(transactionDataJSON: Data) -> [Product]? {
        
        if let transactions : [Transaction] = transform(transactionDataJSON: transactionDataJSON) {
            return self.transform(transactions: transactions)
        } else {
            return []
        }
    }
        
}
