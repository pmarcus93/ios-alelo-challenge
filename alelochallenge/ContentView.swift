//
//  ContentView.swift
//  alelochallenge
//
//  Created by Marcus Vinicius Pereira on 10/09/23.
//

import SwiftUI

struct ContentView: View {
    
    @EnvironmentObject var productStore: ProductStore
    @EnvironmentObject var shoppingCartStore: ShoppingCartStore
    
    var body: some View {
        TabView {
            ProductListView()
                .tabItem {
                    Image(systemName: "tshirt.fill")
                    Text("Produtos")
                }
                .accessibilityLabel("Produtos")
                .accessibilityAddTraits(.isButton)
            
            ShoppingCartView()
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
        for item in shoppingCartStore.shoppingCart {
            quantity += item.quantity
        }
        return quantity
    }
}

#Preview {
    ContentView()
}
