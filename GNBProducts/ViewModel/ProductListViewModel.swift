//
//  ProductListViewModel.swift
//  GNBProducts
//
//  Created by Jaime Lucea on 3/2/23.
//

import Foundation

    
@MainActor class ProductListViewModel : ObservableObject {
    
    @Published var products = [Product]()
    
    // var selectedProduct: Product?
    
    //
    // Loads and publishes products
    //
    func fetchProducts() {
        // Request data from provider
        DataProvider.shared.getTransactions { (result) in
            switch result {
                case .success(let data):
                    // Get list of products from the received transaction data
                    self.products = TransactionDataTransformer().transform(transactions: data)
                    
                case .failure(let error):
                    print(error.localizedDescription)
            }
        }
    }

    
}

