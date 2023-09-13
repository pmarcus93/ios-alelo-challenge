//
//  ContentView.swift
//  alelochallenge
//
//  Created by Marcus Vinicius Pereira on 10/09/23.
//

import SwiftUI

struct ContentView: View {
    
    @Binding var shoppingCart: [productCart]
    @Binding var productsApi: [Product]
    
    var body: some View {
        TabView {
            HomeView(shoppingCart: $shoppingCart, productsApi: $productsApi)
                .tabItem {
                    Image(systemName: "tshirt.fill")
                    Text("Produtos")
                }
            ShoppingCartView(shoppingCart: $shoppingCart, products: $productsApi)
                .tabItem {
                    Image(systemName: "cart.fill")
                    Text("Carrinho")
                }
                .badge(getShoppingCartProductQuantity())
        }
    }
    
    func getShoppingCartProductQuantity() -> Int {
        var quantity = 0
        for item in shoppingCart {
            quantity += item.quantity
        }
        return quantity
    }

}

#Preview {
    ContentView(shoppingCart: .constant([]), productsApi: .constant([]))
}
