//
//  ContentView.swift
//  alelochallenge
//
//  Created by Marcus Vinicius Pereira on 10/09/23.
//

import SwiftUI

struct ContentView: View {
    
    @Binding var shoppingCart: [ProductShoppingCart]
    @Binding var productsApi: [Product]
    
    var body: some View {
        TabView {
            ProductListView(shoppingCart: $shoppingCart, productsApi: $productsApi)
                .tabItem {
                    Image(systemName: "tshirt.fill")
                    Text("Produtos")
                }
                .accessibilityLabel("Produtos")
                .accessibilityAddTraits(.isButton)
            ShoppingCartView(shoppingCart: $shoppingCart, products: productsApi)
                .tabItem {
                    Image(systemName: "cart.fill")
                    Text("Carrinho")
                }
                .badge(getShoppingCartProductQuantity())
                .accessibilityLabel("Carrinho de compras com \(getShoppingCartProductQuantity()) itens adicionados")
                .accessibilityAddTraits(.isButton)
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
    ContentView(shoppingCart: .constant(Product.shoppingCartMock), productsApi: .constant(Product.productsMock))
}
