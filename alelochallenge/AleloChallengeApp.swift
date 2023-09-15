//
//  alelochallengeApp.swift
//  alelochallenge
//
//  Created by Marcus Vinicius Pereira on 10/09/23.
//

import SwiftUI

@main
struct AleloChallengeApp: App {    
    @StateObject var productStore = ProductStore()
    @StateObject var shoppingCartStore = ShoppingCartStore()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(productStore)
                .environmentObject(shoppingCartStore)
                .task {
                    do {
                        try await productStore.loadDataFromApi()
                        productStore.isLoading = false
                    } catch {
                        fatalError("Erro ao carregar os dados da API")
                    }
                }
        }
    }
}
