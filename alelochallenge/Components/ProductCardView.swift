//
//  ProductCard.swift
//  alelochallenge
//
//  Created by Marcus Vinicius Pereira on 10/09/23.
//

import SwiftUI

struct ProductCardView: View {
    let product: Product
    
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text(product.name)
                    .font(.system(size: 14).weight(.bold))
                    .padding(.bottom, 2)
                
                Text(product.onSale ? product.actualPrice : product.regularPrice)
                    .font(.system(size: 14, weight: product.onSale ? .semibold : .regular))
                    .foregroundStyle(product.onSale ? Color.green : Color.primary)
                
                if product.onSale {
                    Text(product.regularPrice)
                        .strikethrough(true)
                        .font(.system(size: 12))
                }
                
                Text("ou \(product.installments)")
                    .font(.caption)
            }
            
            Spacer()
            
            if product.onSale {
                Text("-\(product.discountPercentage)")
                    .foregroundColor(.black)
                    .background(Capsule().foregroundColor(Color.green))
                    .padding()
            }
            
            ZStack {
                if (product.image.isEmpty) {
                    NoImageSmallView()
                } else {
                    AsyncImageSmallView(imageUrl: product.image)
                }
            }
            .frame(width: 75, height: 75)
            .background(Color.white)
        }
    }
}

struct ProductCardView_Previews: PreviewProvider {
    static var products = Product.productsMock
    static var previews: some View {
        List {
            Section(header: Text("Produtos mais vendidos")) {
                ForEach(products, id: \.codeColor) { product in
                    ProductCardView(product: product)
                }
            }
        }
        .listStyle(InsetGroupedListStyle())
    }
}
