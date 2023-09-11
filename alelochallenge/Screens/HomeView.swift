//
//  HomeView.swift
//  alelochallenge
//
//  Created by Marcus Vinicius Pereira on 10/09/23.
//

import SwiftUI

struct HomeView: View {
    
    @Binding var products: [Product]
    @Binding var shoppingCart: [Product]
            
    var body: some View {
        NavigationStack {
            List($products) { $product in
                NavigationLink(destination: ProductDetailsView(product:  $product, shoppingCart: $shoppingCart)) {
                    ProductCardView(product: product)
                }
            }
            .toolbar {
                Button(action: {}) {
                    Image(systemName: "cart.fill")
                }
            }
            .navigationTitle("Mais vendidos")
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView(products: .constant(Product.sampleData), shoppingCart: .constant([]))
    }
}
