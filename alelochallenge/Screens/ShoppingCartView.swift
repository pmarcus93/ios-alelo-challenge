//
//  ShoppingCartView.swift
//  alelochallenge
//
//  Created by Marcus Vinicius Pereira on 12/09/23.
//

import SwiftUI

struct ShoppingCartView: View {
    @Binding var shoppingCart: [ProductApi]
    var body: some View {
        VStack {
            if (shoppingCart.isEmpty) {
                Text("Nenhum produto adicionado ao carrinho. Volte à lista de produtos e adicione produtos!")
            } else {
                List {
                    ForEach($shoppingCart, id: \.name) { $product in
                        ProductCardView(product: product)
                    }
                    .onDelete(perform: self.deleteItemFromCart)
                }
            }
        }
    }
    
    private func deleteItemFromCart(at indexSet: IndexSet) {
        self.shoppingCart.remove(atOffsets: indexSet)
    }
}

#Preview {
    ShoppingCartView(shoppingCart: .constant([]))
}
