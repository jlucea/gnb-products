//
//  TransactionService.swift
//  GNBProducts
//
//  Created by Jaime Lucea on 31/1/23.
//

import Foundation

class TransactionService : ObservableObject {
        
    private var transactions = [Transaction]()
    
    @Published var products = [Product]()
    
    init() {
        if products.isEmpty {
            loadData()
        }
    }
    
    //
    // Calls the transaction API and populates both the transactions property
    //  and the products property
    //
    private func loadData(){
        TransactionsWS().getJSONData { (result) in
            switch result {
                case .success(let data):
                    // Data from web service recevied.
                    // Parse JSON
                    let decoded = self.parseTransactionJSON(data: data)
                
                    if decoded != nil {
                        // Published data is uptaded in the main thread
                        DispatchQueue.main.async { () -> Void in
                            
                            self.transactions = decoded!
                            self.products = self.getProductsFrom(transactionData: decoded!)
                            print("\(self.products.count) products loaded")
                        }
                    }
                
                case .failure(let error):
                    print(error.localizedDescription)
            }
        }
    }
    
    //
    // Parses an Array of Transactions from a JSON formatted data block
    //
    private func parseTransactionJSON(data: Data) -> [Transaction]? {
        do {
            let transactions = try JSONDecoder().decode([Transaction].self, from: data)

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
    private func getProductsFrom(transactionData: [Transaction]) -> [Product] {
        if transactionData.isEmpty == false {
            let uniqueProductNames = Set(transactionData.map({$0.sku}))
            return uniqueProductNames.map {Product(name: $0)}
        }else{
            return []
        }
    }
    
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
