//
//  HomeView.swift
//  alelochallenge
//
//  Created by Marcus Vinicius Pereira on 10/09/23.
//

import SwiftUI

struct ProductListView: View {
    
    @Binding var shoppingCart: [ProductShoppingCart]
    @Binding var productsApi: [Product]
    @State private var isLoading = true
    let apiURL = "https://alelo-exacta-challenge.free.mockoapp.net/products"
    
    var body: some View {
        NavigationStack {
            List {
                Section(header: Text("Produtos mais vendidos")) {
                    if isLoading {
                        ProgressView()
                    } else {
                        ForEach($productsApi, id: \.codeColor) { $product in
                            NavigationLink(destination: ProductDetailsView(product: $product, shoppingCart: $shoppingCart)) {
                                ProductCardView(product: product)
                            }
                        }
                    }
                }
            }
            .listStyle(InsetGroupedListStyle())
            .onAppear {
                fetchData()
            }
        }
    }

    func fetchData() {
        guard let url = URL(string: apiURL) else {
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
        ProductListView(shoppingCart: .constant(Product.shoppingCartMock), productsApi: .constant(Product.productsMock))
    }
}
