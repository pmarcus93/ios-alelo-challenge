//
//  EmptyCartView.swift
//  alelochallenge
//
//  Created by Marcus Vinicius Pereira on 14/09/23.
//

import SwiftUI

struct EmptyCartView: View {
    var body: some View {
        VStack {
            Image(systemName: "cart.badge.minus")
                .font(.largeTitle)
                .foregroundColor(.gray)
            
            Text("Seu carrinho de compras está vazio")
                .font(.headline)
                .foregroundColor(.gray)
            
            Text("Que tal adicionar alguns produtos no carrinho?")
                .font(.subheadline)
                .foregroundColor(.gray)
        }
        .padding()
    }
}

#Preview {
    EmptyCartView()
}
