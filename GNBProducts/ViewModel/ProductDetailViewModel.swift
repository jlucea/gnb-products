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
    @Published var totalAmount : Double = 0
    
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
                
                    // Filter transactions by product
                    let filteredTransactions = data.filter { transaction in
                        return transaction.sku == self.product.name
                    }
                                    
                    print("\(filteredTransactions.count) transactions found for product \(self.product.name)")
                
                    self.productTransactions = filteredTransactions
                
                    DataProvider.shared.getRates(completion: { (result) in

                        switch result {
                            case .success(let crates):
                                // Calculate total
                                self.totalAmount = ConversionRateTransformer().calculateTotalAmountInEuros(transactions: filteredTransactions, rates: crates)
                            
                            case .failure(let error):
                                print("Error \(error.localizedDescription)")
                        }
                            
                    })
                case .failure(let error):
                    print(error.localizedDescription)
            }
        }
    }
    
    
    
    
    
}

