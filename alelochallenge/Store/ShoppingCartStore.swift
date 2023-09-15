//
//  ShoppingCartStore.swift
//  alelochallenge
//
//  Created by Marcus Vinicius Pereira on 15/09/23.
//

import Foundation

class ShoppingCartStore: ObservableObject {
    @Published var shoppingCart: [ProductShoppingCart] = []
}
