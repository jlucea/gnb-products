//
//  TransactionData.swift
//  GNBProducts
//
//  Created by Jaime Lucea on 31/1/23.
//

import Foundation

struct Transaction : Decodable, Identifiable {
    
    var id = UUID()
    
    let sku : String
    let amount : Double
    let currency : String
    
    init(product: String, amount: Double, currency: String){
        self.sku = product
        self.amount = amount
        self.currency = currency
    }
    
    private enum CodingKeys: String, CodingKey {
      case sku
      case amount
      case currency
    }
    
}
