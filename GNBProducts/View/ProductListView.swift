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
            List(vm.products) { product in
              VStack(alignment: .leading) {
                  Text(product.name)
                      .font(.headline)
              }
            }
        }
        .padding()
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ProductListView()
    }
}
