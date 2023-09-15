//
//  ProductStore.swift
//  alelochallenge
//
//  Created by Marcus Vinicius Pereira on 15/09/23.
//

import Foundation

class ProductStore: ObservableObject {
    @Published var products: [Product] = []
    @Published var isLoading: Bool = true
    
    func loadDataFromApi() async throws {
        
        let apiURL = "https://alelo-exacta-challenge.free.mockoapp.net/products"

        guard let url = URL(string: apiURL) else {
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let data = data {
                do {
                    let productResponse = try JSONDecoder().decode(ProductResponse.self, from: data)
                    DispatchQueue.main.async {
                        self.products = productResponse.products
                        self.isLoading = false
                    }
                } catch {
                    print("Erro ao decodificar o JSON obtido pela API: \(error)")
                }
                self.showData()
            }
        }.resume()
    }
    
    func showData() {
        print(products)
    }
}
