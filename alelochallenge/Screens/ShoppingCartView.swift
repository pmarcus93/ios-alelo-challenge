//
//  ShoppingCartView.swift
//  alelochallenge
//
//  Created by Marcus Vinicius Pereira on 12/09/23.
//

import SwiftUI

struct ShoppingCartView: View {
    @Binding var shoppingCart: [ProductShoppingCart]
    @Binding var products: [Product]

    var body: some View {
        VStack {
            List {
                if shoppingCart.isEmpty {
                    Text("Nenhum produto adicionado ao carrinho!")
                } else {
                    ForEach(shoppingCart, id: \.sku) { shoppingCardProduct in
                        ShoppingCartItemView(product: findProduct(by: shoppingCardProduct.productId), shoppingCardProduct: shoppingCardProduct)
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

struct ShoppingCartItemView: View {
    var product: Product?
    var shoppingCardProduct: ProductShoppingCart

    var body: some View {
        VStack {
            if let product = product {
                ProductCardView(product: product)
            }
            HStack {
                Text("Tam.: \(shoppingCardProduct.size)")
                    .font(.caption)
                Text("Quantidade: \(shoppingCardProduct.quantity)")
                    .font(.caption)
                Spacer()
            }
        }
    }
}

struct TotalPriceView: View {
    var shoppingCart: [ProductShoppingCart]
    var products: [Product]

    var body: some View {
        HStack {
            Spacer()
            Text("Valor total:")
            Text("R$\(shoppingCartTotal)")
                .foregroundColor(Color.green)
                .fontWeight(.bold)
        }
    }

    private var shoppingCartTotal: String {
        var totalPrice: Double = 0

        for item in shoppingCart {
            if let product = products.first (where: { $0.codeColor == item.productId }) {
                if let productPrice = removeCurrencySymbolAndParse(product.actualPrice) {
                    totalPrice += productPrice
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


#Preview {
    ShoppingCartView(shoppingCart: .constant(Product.shoppingCartMock), products: .constant(Product.productsMock))
}
