//
//  alelochallengeApp.swift
//  alelochallenge
//
//  Created by Marcus Vinicius Pereira on 10/09/23.
//

import SwiftUI

@main
struct alelochallengeApp: App {
    @State private var shoppingCart: [productCart] = []
    @State private var productsApi: [ProductApi] = []

    var body: some Scene {
        WindowGroup {
            ContentView(shoppingCart: $shoppingCart, productsApi: $productsApi)
        }
    }
}
