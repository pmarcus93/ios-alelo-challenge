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
                    ForEach(shoppingCart, id: \.sku) { shoppingCardProduct in
                            VStack {
                                if let product = products.first(where: { $0.codeColor == shoppingCardProduct.productId }) {
                                    ProductCardView(product: product)
                                }
                                HStack() {
                                    Text("Tamanho: \(shoppingCardProduct.size)")
                                    Text("Quantidade: \(shoppingCardProduct.quantity)")
                                }
                            }
                    }.onDelete { indexSet in
                        shoppingCart.remove(atOffsets: indexSet)
                    }
                }
            }
        }
    }
}

/*
#Preview {
    ShoppingCartView(shoppingCart: .constant([]))
}
*/
