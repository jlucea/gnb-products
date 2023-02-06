//
//  ProductListViewModel.swift
//  GNBProducts
//
//  Created by Jaime Lucea on 3/2/23.
//

import Foundation

extension ProductListView {
    
    @MainActor class ProductListViewModel : ObservableObject {
        
        @Published var products = [Product]()
        
        //
        // Calls the transaction API and populates both the published products property
        //
//        func fetchProducts() {
//            TransactionsWS().getJSONData { (result) in
//                switch result {
//                    case .success(let data):
//                        // Data from web service received
//                        if let products : [Product] = TransactionDataTransformer().transform(transactionDataJSON: data) {
//                            // Published data is uptaded in the main thread
//                            DispatchQueue.main.async { () -> Void in
//                                self.products = products
//                                print("\(self.products.count) products loaded")
//                            }
//                        }
//                    case .failure(let error):
//                        print(error.localizedDescription)
//                }
//            }
//        }
        
        
        //
        // Requests data to DataProvider, transforms with DataTransformer and populates published products property
        //
        func fetchProducts() {
            
            let dp = DataProvider()
            dp.getTransactions { (result) in
                
                switch result {
                case .success(let data):
                    self.products = TransactionDataTransformer().transform(transactions: data)
                    
                case .failure(let error):
                    print(error.localizedDescription)
                }
            }
        }

        
    }

}

