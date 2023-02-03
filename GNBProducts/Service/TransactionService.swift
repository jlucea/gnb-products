//
//  TransactionService.swift
//  GNBProducts
//
//  Created by Jaime Lucea on 31/1/23.
//

import Foundation

class TransactionService : ObservableObject {
        
//    @Published var transactions : [Transaction]? = []
//
//    func getProducts() -> Set<String> {
//
//        guard transactions != nil else { return [] }
//        if transactions!.isEmpty {
//            return Set(transactions!.map({$0.sku}))
//        }else{
//            return []
//        }
//    }
//
//
//    func loadTransactions(){
//        TransactionsWS().getJSONData { (result) in
//            switch result {
//                case .success(let data):
//                    // Data from web service recevied.
//                    // Parse JSON
//                    let decoded = self.parseTransactionJSON(data: data)
//
//                    // Published data is uptaded in the main thread
//                    DispatchQueue.main.async { () -> Void in
//                        self.transactions = decoded
//
//                    }
//
//                case .failure(let error):
//                    print(error.localizedDescription)
//            }
//        }
//    }
//
//    func parseTransactionJSON(data: Data) -> [Transaction]? {
//        do {
//            let transactions = try JSONDecoder().decode([Transaction].self, from: data)
//
//            print("\(transactions.count) transactions decoded")
//            return transactions
//
//        } catch {
//            print("JSON decoding error")
//            return nil
//        }
//    }
    
}
