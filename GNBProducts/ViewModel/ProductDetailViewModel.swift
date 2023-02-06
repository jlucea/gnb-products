//
//  ProductDetailViewModel.swift
//  GNBProducts
//
//  Created by Jaime Lucea on 3/2/23.
//

import Foundation
import SwiftUI
    
class ProductDetailViewModel : ObservableObject {
    
    @Published var product : Product
    @Published var productTransactions = [Transaction]()
    
    init(product: Product) {
        self.product = product
    }
    
    //
    // Loads and publishes transactions for the specified product
    //
    func fetchTransactions() {
        // Request data from provider
        DataProvider.shared.getTransactions { (result) in
            switch result {
                case .success(let data):
                
                    let filteredTransactions = data.filter { transaction in
                        return transaction.sku == self.product.name
                    }
                
                    // let filtered = TransactionDataTransformer().filterByProduct(transactions: data, product: self.product)
                    
                    print("\(filteredTransactions.count) transactions found for product \(self.product.name)")
                
                    self.productTransactions = filteredTransactions
                    
                case .failure(let error):
                    print(error.localizedDescription)
            }
        }
    }
    
}

