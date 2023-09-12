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
                            NavigationLink(destination: ShoppingCartView(shoppingCart: $shoppingCart)) {
                                BadgeLabelView(text: "Carrinho", productAmount: shoppingCart.count, icon: "cart.fill")
                            }
                        }
                    }
                }
            }.onAppear {
                fetchData()
            }
            .navigationTitle("Mais vendidos")
        }
    }
    
    func fetchData() {
        guard let url = URL(string: "https://alelo-exacta-challenge.free.mockoapp.net/products") else {
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

struct BadgeLabelView: View {
    var text: String
    var productAmount: Int
    var icon: String
    
    var body: some View {
        HStack {
            Label(text, systemImage: icon)
            Spacer()
            
            if (productAmount != 0) {
                Text("\(productAmount)")
                    .font(.footnote)
                    .padding(5)
                    .background(Color.red)
                    .foregroundColor(.white)
                    .cornerRadius(20)
            }
        }
    }
    
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView(shoppingCart: .constant([]))
    }
}
