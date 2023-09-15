//
//  PriceDetailsView.swift
//  alelochallenge
//
//  Created by Marcus Vinicius Pereira on 15/09/23.
//

import SwiftUI

struct PriceDetailsView: View {
    var onSale: Bool
    var regularPrice: String
    var actualPrice: String
    var installments: String
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(onSale ? actualPrice : regularPrice)
                .font(.system(size: 14, weight: onSale ? .semibold : .regular))
                .foregroundStyle(onSale ? Color.green : Color.primary)
            
            if onSale {
                Text(regularPrice)
                    .strikethrough(true)
                    .font(.system(size: 12))
            }
            
            Text("ou \(installments)")
                .font(.caption)
        }
    }
}


struct PriceDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        return PriceDetailsView(
             onSale: Product.productsMock[1].onSale,
             regularPrice: Product.productsMock[1].regularPrice,
             actualPrice: Product.productsMock[1].actualPrice,
             installments: Product.productsMock[1].installments
        )
    }
}
