//
//  ShoppingCartView.swift
//  alelochallenge
//
//  Created by Marcus Vinicius Pereira on 12/09/23.
//

import SwiftUI

struct ShoppingCartView: View {
    @Binding var shoppingCart: [ProductShoppingCart]
    var products: [Product]
    
    var body: some View {
        VStack {
                if shoppingCart.isEmpty {
                    EmptyCartView()
                } else {
                    List {
                        ForEach($shoppingCart, id: \.sku) { $shoppingCardProduct in
                            ShoppingCartItemView(product: findProduct(by: shoppingCardProduct.productId), shoppingCardProduct: $shoppingCardProduct, shoppingCart: $shoppingCart)
                        }.onDelete { indexSet in
                            shoppingCart.remove(atOffsets: indexSet)
                        }
                    TotalPriceView(shoppingCart: shoppingCart, products: products)
                }
            }
        }
    }
    
    private func findProduct(by productId: String) -> Product? {
        return products.first { $0.codeColor == productId }
    }
}

#Preview {
    ShoppingCartView(shoppingCart: .constant(Product.shoppingCartMock), products: Product.productsMock)
}
