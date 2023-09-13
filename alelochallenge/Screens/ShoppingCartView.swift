//
//  ShoppingCartView.swift
//  alelochallenge
//
//  Created by Marcus Vinicius Pereira on 12/09/23.
//

import SwiftUI

struct ShoppingCartView: View {
    @Binding var shoppingCart: [productCart]
    @Binding var products: [ProductApi]

    var body: some View {
        VStack {
            if (shoppingCart.isEmpty) {
                Text("Nenhum produto adicionado ao carrinho. Volte à lista de produtos e adicione produtos!")
            } else {
                List {
                    VStack {
                        ForEach(shoppingCart, id: \.sku) { shoppingCardProduct in
                            if let product = products.first(where: { $0.codeColor == shoppingCardProduct.productId }) {
                                VStack {
                                    ProductCardView(product: product)
                                    HStack() {
                                        Spacer()
                                        Text("Tamanho: \(shoppingCardProduct.size)")
                                        Text("Quantidade: \(shoppingCardProduct.quantity)")
                                        if(shoppingCardProduct.quantity == 1) {
                                            Label("Remover", systemImage: "trash.fill")
                                        }
                                    }
                                }
                            }
                        }
                        .onDelete(perform: self.deleteItemFromCart)
                    }
                }
            }
        }
    }
    
    private func deleteItemFromCart(at indexSet: IndexSet) {
        self.shoppingCart.remove(atOffsets: indexSet)
    }
}
/*
#Preview {
    ShoppingCartView(shoppingCart: .constant([]))
}
*/
