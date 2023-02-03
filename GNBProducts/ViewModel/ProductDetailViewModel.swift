//
//  ProductDetailViewModel.swift
//  GNBProducts
//
//  Created by Jaime Lucea on 3/2/23.
//

import Foundation

extension ProductDetailView {
    
    class ProductDetailViewModel : ObservableObject {
        
        @Published var productTransactions : [Transaction] = [Transaction(product: "T2006", amount: 34.55, currency: "CAD"),
                                                   Transaction(product: "T2006", amount: 22.35, currency: "EUR")]
        
        
        /*
         func getProductTransactions(product: Product) -> [Transaction] {
         return transactions.filter { $0.sku == product.name }
         }
         */
        
        
        
    }
}
