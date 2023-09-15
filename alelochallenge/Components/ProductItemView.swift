//
//  ProductCard.swift
//  alelochallenge
//
//  Created by Marcus Vinicius Pereira on 10/09/23.
//

import SwiftUI

struct ProductItemView: View {
    let product: Product
    
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text(product.name)
                    .font(
                        .system(size: 14)
                        .weight(.bold))
                    .padding(.bottom, 1)
                
                PriceDetailsView(
                    onSale: product.onSale,
                    regularPrice: product.regularPrice,
                    actualPrice: product.actualPrice,
                    installments: product.installments)
            }
            
            HStack {
                Spacer()
                DiscountedPercentagePillView(
                    onSale: product.onSale,
                    discountPercentage: product.discountPercentage
                )
                ImageLoaderSmallView(imageUrl: product.image)
            }
        }
    }
}

struct ProductCardView_Previews: PreviewProvider {
    static var products = Product.productsMock
    static var previews: some View {
        List {
            Section(header: Text("Produtos mais vendidos")) {
                ForEach(products, id: \.codeColor) { product in
                    ProductItemView(product: product)
                }
            }
        }
        .listStyle(InsetGroupedListStyle())
    }
}
