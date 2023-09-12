//
//  HomeView.swift
//  alelochallenge
//
//  Created by Marcus Vinicius Pereira on 10/09/23.
//

import SwiftUI

struct HomeView: View {
    
    @Binding var shoppingCart: [ProductApi]
    @State private var productsApi: [ProductApi] = []
    @State private var isLoading = true
    
    var body: some View {
        NavigationStack {
            VStack {
                if (isLoading) {
                    ProgressView()
                } else {
                    List($productsApi, id: \.name) { $product in
                        NavigationLink(destination: ProductDetailsView(product: $product, shoppingCart: $shoppingCart)) {
                            ProductCardView(product: product)
                        }
                    }
                    .toolbar {
                        Button(action: {}) {
                            Image(systemName: "cart.fill")
                        }
                    }
                    .navigationTitle("Mais vendidos")
                }
            }.onAppear {
                fetchData()
            }
        }
    }
    
    func fetchData() {
        guard let url = URL(string: "https://www.mocky.io/v2/59b6a65a0f0000e90471257d") else {
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let data = data {
                do {
                    let productResponse = try JSONDecoder().decode(ProductResponse.self, from: data)
                    DispatchQueue.main.async {
                        self.productsApi = productResponse.products
                        isLoading = false
                    }
                } catch {
                    print("Erro ao decodificar o JSON obtido pela API: \(error)")
                }
            }
        }.resume()
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView(shoppingCart: .constant([]))
    }
}
