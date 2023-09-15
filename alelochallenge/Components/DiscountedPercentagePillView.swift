//
//  DiscountedPriceView.swift
//  alelochallenge
//
//  Created by Marcus Vinicius Pereira on 15/09/23.
//

import SwiftUI

struct DiscountedPercentagePillView: View {
    var onSale: Bool
    var discountPercentage: String
    var textSize: CGFloat?
        
    var body: some View {
        if onSale {
            ZStack {
                Rectangle()
                    .fill(Color.green)
                    .frame(width: 55, height: 25)
                    .cornerRadius(10)
                Text("-\(discountPercentage)")
                    .foregroundColor(.black)
                    .background(Capsule().foregroundColor(Color.green))
                    .padding(.horizontal)
            }
        }
    }
}

#Preview {
    DiscountedPercentagePillView(
        onSale: Product.productsMock[3].onSale,
        discountPercentage: Product.productsMock[3].discountPercentage
    )
}
