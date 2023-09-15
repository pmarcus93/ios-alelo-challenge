//
//  HomeView.swift
//  alelochallenge
//
//  Created by Marcus Vinicius Pereira on 10/09/23.
//

import SwiftUI

struct ProductListView: View {
    
    let apiURL = "https://alelo-exacta-challenge.free.mockoapp.net/products"
        
    @EnvironmentObject var productStore: ProductStore
    @EnvironmentObject var shoppingCartStore: ShoppingCartStore
    
    var body: some View {
        NavigationStack {
            List {
                Section(header: Text("Produtos mais vendidos")) {
                    if productStore.isLoading {
                        //ProgressView()
                    } else {
                        ForEach($productStore.products, id: \.codeColor) { $product in
                            NavigationLink(destination: ProductDetailsView(product: $product, shoppingCart: $shoppingCartStore.shoppingCart)) {
                                ProductItemView(product: product)
                            }
                        }
                    }
                }
            }
            .listStyle(InsetGroupedListStyle())
        }
    }
}


struct ProductListView_Previews: PreviewProvider {
    static var productStore = ProductStore()
    static var shoppingCartStore = ShoppingCartStore()
    
    static var previews: some View {
        productStore.products = Product.productsMock
        productStore.isLoading = false
        shoppingCartStore.shoppingCart = Product.shoppingCartMock
        
        return ProductListView()
            .environmentObject(productStore)
            .environmentObject(shoppingCartStore)
    }
}
