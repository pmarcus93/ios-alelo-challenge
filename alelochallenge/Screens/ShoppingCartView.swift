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
        VStack() {
            List {
                if (shoppingCart.isEmpty) {
                    Text("Nenhum produto adicionado ao carrinho!")
                } else {
                    ForEach(shoppingCart, id: \.sku) { shoppingCardProduct in
                            VStack {
                                if let product = products.first(where: { $0.codeColor == shoppingCardProduct.productId }) {
                                    ProductCardView(product: product)
                                }
                                HStack() {
                                    Text("Tam.: \(shoppingCardProduct.size)")
                                        .font(.caption)
                                    Text("Quantidade: \(shoppingCardProduct.quantity)")
                                        .font(.caption)
                                    Spacer()
                                }
                            }
                    }.onDelete { indexSet in
                        shoppingCart.remove(atOffsets: indexSet)
                    }
                    HStack {
                        Spacer()
                        Text("Valor total:")
                        Text("R$\(shoppingCartTotal())")
                            .foregroundColor(Color.green)
                            .fontWeight(.bold)
                    }
                }
            }
        }
    }
    
    func shoppingCartTotal() -> String {
        var totalPrice: Double = 0

        for item in shoppingCart {
            if let product = products.first (where: { $0.codeColor == item.productId }) {
                if let productPrice = removeCurrencySymbolAndParse(product.actualPrice) {
                    totalPrice += productPrice
                } else {
                    print("Erro ao fazer o parse do valor monetário: \(product.actualPrice)")
                }
            }
        }
        return String(format: "%.2f", totalPrice)
    }
}


func removeCurrencySymbolAndParse(_ input: String) -> Double? {
    let sanitizedInput = input.replacingOccurrences(of: ",", with: ".")
    
    let cleanedString = sanitizedInput.replacingOccurrences(of: "[^0-9.]", with: "", options: .regularExpression)
    
    if let numericValue = Double(cleanedString) {
        let formattedValue = String(format: "%.2f", numericValue)
        return Double(formattedValue)
    } else {
        return nil
    }
}



/*
#Preview {
    ShoppingCartView(shoppingCart: .constant([]))
}
*/
