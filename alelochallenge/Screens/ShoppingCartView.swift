//
//  ShoppingCartView.swift
//  alelochallenge
//
//  Created by Marcus Vinicius Pereira on 12/09/23.
//

import SwiftUI

struct ShoppingCartView: View {
    @EnvironmentObject var productStore: ProductStore
    @EnvironmentObject var shoppingCartStore: ShoppingCartStore
    
    var body: some View {
        VStack {
                if shoppingCartStore.shoppingCart.isEmpty {
                    EmptyCartView()
                } else {
                    List {
                        Section(header: Text("Carrinho de compras")) {
                            ForEach($shoppingCartStore.shoppingCart, id: \.sku) { $shoppingCartProduct in
                                ShoppingCartItemView(
                                    product: findProduct(by: shoppingCartProduct.productId),
                                    shoppingCartProduct: $shoppingCartProduct
                                )
                            }.onDelete { indexSet in
                                shoppingCartStore.shoppingCart.remove(atOffsets: indexSet)
                            }
                            TotalPriceView(
                                shoppingCart: shoppingCartStore.shoppingCart,
                                products: productStore.products)
                    }
                }
            }
        }
    }
    
    private func findProduct(by productId: String) -> Product? {
        return productStore.products.first { $0.codeColor == productId }
    }
}

struct ShoppingCartView_Previews: PreviewProvider {
    static var productStore = ProductStore()
    static var shoppingCartStore = ShoppingCartStore()
    
    static var previews: some View {
        shoppingCartStore.shoppingCart = Product.shoppingCartMock

        return ShoppingCartView()
            .environmentObject(productStore)
            .environmentObject(shoppingCartStore)
    }
}
