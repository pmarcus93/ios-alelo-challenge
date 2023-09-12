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
                Text("\(product.name)")
                    .font(.system(size: 14) .weight(.bold))
                Spacer()
                if (product.onSale) {
                    Text("\(product.actualPrice)").foregroundStyle(Color.green)
                        .font(.system(size: 14, weight: .semibold))
                    Text("\(product.regularPrice)").strikethrough(true).font(.system(size: 12))
                } else {
                    Text("\(product.regularPrice)").font(.system(size: 14))
                }
            }.padding()
            Spacer()
            AsyncImage(url: URL(string: product.image)) { phase in
                if let image = phase.image {
                image
                    .resizable()
                    .scaledToFit()
                } else if phase.error != nil {
                Color.red
                } else {
                Color.white
                }
            }.frame(width: 75, height: 75)
                .background(Color.white)
        }
    }
}

struct ProductCardView_Previews: PreviewProvider {
    static var product = Product.sampleData[0]
    static var previews: some View {
        ProductCardView(product: product)
            .previewLayout(.fixed(width: 480, height: 150))
    }
}

