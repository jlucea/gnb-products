//
//  ContentView.swift
//  GNBProducts
//
//  Created by Jaime Lucea on 31/1/23.
//

import SwiftUI

struct ProductListView: View {
        
    @ObservedObject var vm = ProductListViewModel()
    
    // @Binding var selectedProduct: Product?
    
    var body: some View {
        
        VStack {
            NavigationView {
                List(vm.products) { product in
                    NavigationLink (destination: ProductDetailView(vm: ProductDetailViewModel(product: product))) {
                        Text(product.name).font(.subheadline)
                    }
                }
                .navigationTitle("Products")
            }
            .onAppear() {
                vm.fetchProducts()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ProductListView()
    }
}
