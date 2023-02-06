//
//  ProductDetailView.swift
//  GNBProducts
//
//  Created by Jaime Lucea on 3/2/23.
//

import SwiftUI


struct ProductDetailView: View {
            
    @ObservedObject var vm : ProductDetailViewModel
    
    var body: some View {
        VStack {
            // Product name
            Text(vm.product.name)
                .font(.headline)
                .padding(.top)
            
            // Total sum in EUR
            Text("EUR 4223.89")
                .padding(.top)
            
            // Transactions
            List(vm.productTransactions) { transaction in
              VStack(alignment: .leading) {
                  Text("\(transaction.currency) \(transaction.amount)")
                      .font(.subheadline)
              }
            }
            .onAppear(){
                vm.fetchTransactions()
            }
        }
        .padding()
    }
    
}

//struct ProductDetailView_Previews: PreviewProvider {
//    static var previews: some View {
//        ProductDetailView(
//            product: Product(name: "T2006")
////            transactions:  [Transaction(product: "T2006", amount: 34.55, currency: "CAD"),
////                            Transaction(product: "T2006", amount: 22.35, currency: "EUR"),
////                            Transaction(product: "T2006", amount: 11.95, currency: "CAD"),
////                            Transaction(product: "T2006", amount: 09.5, currency: "USD"),
////                            Transaction(product: "T2006", amount: 88.11, currency: "EUR"),
////                            Transaction(product: "T2006", amount: 467.22, currency: "EUR")
////                           ]
//        )
//    }
//}
