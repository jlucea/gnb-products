//
//  ContentView.swift
//  GNBProducts
//
//  Created by Jaime Lucea on 31/1/23.
//

import SwiftUI

struct ProductListView: View {
        
    @StateObject var vm = ProductListViewModel()
    
    var body: some View {
        
        VStack {
            NavigationView {
                List {
                    ForEach(vm.products) { product in
                        NavigationLink (
                            destination: ProductDetailView(product: product),
                            label: {
                                Text(product.name)
                                    .font(.subheadline)
                            })
                    }
                }
            }
        }
        .navigationTitle("GNB Products")
        .padding()
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ProductListView()
    }
}
