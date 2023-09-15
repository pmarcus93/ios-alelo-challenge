//
//  ShoppingCartItemView.swift
//  alelochallenge
//
//  Created by Marcus Vinicius Pereira on 14/09/23.
//

import SwiftUI

struct ShoppingCartItemView: View {
    var product: Product?
    @Binding var shoppingCardProduct: ProductShoppingCart
    @Binding var shoppingCart: [ProductShoppingCart]
    
    var body: some View {
        VStack {
        
            if let product = product {
                ProductItemView(product: product)
            }
                
            HStack() {
                Text("Tamanho:")
                    .font(.system(size: 14))
                Text("\(shoppingCardProduct.size)")
                    .font(.system(size: 16).weight(.bold))
                
                Stepper {
                    HStack(spacing: 0) {
                        Text("Quantidade: ")
                            .font(.system(size: 14))
                        Text("\(shoppingCardProduct.quantity)")
                            .font(.system(size: 16).weight(.bold))
                    }
                } onIncrement: {
                    shoppingCardProduct.quantity += 1
                } onDecrement: {
                    if (shoppingCardProduct.quantity > 1) {
                        shoppingCardProduct.quantity -= 1
                    } else {
                        shoppingCart.removeAll {$0.sku == shoppingCardProduct.sku}
                    }
                }
            }.padding(.top)
        }
    }
}

#Preview {
    ShoppingCartItemView(product: Product.productsMock[0], shoppingCardProduct: .constant(Product.shoppingCartMock[0]), shoppingCart: .constant(Product.shoppingCartMock))
}
