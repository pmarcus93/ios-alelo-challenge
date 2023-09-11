//
//  alelochallengeApp.swift
//  alelochallenge
//
//  Created by Marcus Vinicius Pereira on 10/09/23.
//

import SwiftUI

@main
struct alelochallengeApp: App {
    @State private var products = Product.sampleData
    @State private var shoppingCart: [Product] = []

    var body: some Scene {
        WindowGroup {
            HomeView(products: $products, shoppingCart: $shoppingCart)
        }
    }
}
