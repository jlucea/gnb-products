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
            let formattedTotal = String(format: "%.2f", vm.totalAmount)
            Text(formattedTotal)
            
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
    }
    
}

struct ProductDetailView_Previews: PreviewProvider {
    static var previews: some View {
        ProductDetailView(vm: ProductDetailViewModel(product: Product(name: "T5555")))
    }
}
