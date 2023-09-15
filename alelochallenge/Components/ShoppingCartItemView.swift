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
    @Binding var shoppingCart: [ProductShoppingCart]
    
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
                        shoppingCart.removeAll {$0.sku == shoppingCartProduct.sku}
                    }
                }
            }.padding(.top)
        }
    }
}

#Preview {
    ShoppingCartItemView(product: Product.productsMock[0], shoppingCartProduct: .constant(Product.shoppingCartMock[0]), shoppingCart: .constant(Product.shoppingCartMock))
}
