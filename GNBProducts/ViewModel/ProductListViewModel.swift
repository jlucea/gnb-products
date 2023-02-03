//
//  ProductListViewModel.swift
//  GNBProducts
//
//  Created by Jaime Lucea on 3/2/23.
//

import Foundation

class ProductListViewModel : ObservableObject {
    
    @Published var products : [Product] = []
    
    var transactions : [Transaction] = []
    
    init() {
        loadData()
    }
    
    //
    // Returns the set of unique products contained in an array of transactions
    //
    func getProducts(transactionData: [Transaction]) -> [Product] {
        if transactionData.isEmpty == false {
            let uniqueProductNames = Set(transactionData.map({$0.sku}))
            return uniqueProductNames.map {Product(name: $0)}
        }else{
            return []
        }
    }
    
    func getProductTransactions(product: Product) -> [Transaction] {
        return transactions.filter { $0.sku == product.name }
    }
    
    func loadData(){
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
                            self.products = self.getProducts(transactionData: decoded!)
                            print("\(self.products.count) products loaded")
                        }
                    }
                
                case .failure(let error):
                    print(error.localizedDescription)
            }
        }
    }
    
    
    func parseTransactionJSON(data: Data) -> [Transaction]? {
        do {
            let transactions = try JSONDecoder().decode([Transaction].self, from: data)

            print("\(transactions.count) transactions decoded")
            return transactions
            
        } catch {
            print("JSON decoding error")
            return nil
        }
    }
    
    
    
    
}
