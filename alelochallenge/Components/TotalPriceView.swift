//
//  TotalPriceView.swift
//  alelochallenge
//
//  Created by Marcus Vinicius Pereira on 14/09/23.
//

import SwiftUI

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
                    totalPrice += (productPrice * Double(item.quantity))
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
    TotalPriceView(shoppingCart: Product.shoppingCartMock, products: Product.productsMock)
}
