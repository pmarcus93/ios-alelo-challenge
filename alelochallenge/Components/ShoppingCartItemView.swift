//
//  ShoppingCartItemView.swift
//  alelochallenge
//
//  Created by Marcus Vinicius Pereira on 14/09/23.
//

import SwiftUI

struct ShoppingCartItemView: View {
    var product: Product?
    @Binding var shoppingCartProduct: ProductShoppingCart
    @EnvironmentObject var shoppingCartStore: ShoppingCartStore
    
    var body: some View {
        VStack {
        
            if let product = product {
                ProductItemView(product: product)
            }
                
            HStack() {
                Text("Tamanho:")
                    .font(.system(size: 14))
                Text("\(shoppingCartProduct.size)")
                    .font(.system(size: 16).weight(.bold))
                
                Stepper {
                    HStack(spacing: 0) {
                        Text("Quantidade: ")
                            .font(.system(size: 14))
                        Text("\(shoppingCartProduct.quantity)")
                            .font(.system(size: 16).weight(.bold))
                    }
                } onIncrement: {
                    shoppingCartProduct.quantity += 1
                } onDecrement: {
                    if (shoppingCartProduct.quantity > 1) {
                        shoppingCartProduct.quantity -= 1
                    } else {
                        shoppingCartStore.shoppingCart.removeAll {$0.sku == shoppingCartProduct.sku}
                    }
                }
            }.padding(.top)
        }
    }
}

struct ShoppingCartItemView_Previews: PreviewProvider {
    static var shoppingCartStore = ShoppingCartStore()

    static var previews: some View {
        shoppingCartStore.shoppingCart = Product.shoppingCartMock

        return ShoppingCartItemView(
            product: Product.productsMock[1],
            shoppingCartProduct: .constant(Product.shoppingCartMock[0])
        )
        .environmentObject(shoppingCartStore)
    }
}
