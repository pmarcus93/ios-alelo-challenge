//
//  ProductDetailsView.swift
//  alelochallenge
//
//  Created by Marcus Vinicius Pereira on 10/09/23.
//

import SwiftUI

struct ProductDetailsView: View {
    @Binding var product: ProductApi
    @Binding var shoppingCart: [ProductApi]
    @State private var selectedSize = ""
    @Environment(\.presentationMode) var presentationMode

    var avaiableSizes = [String]()
    
    var body: some View {
        
        ZStack() {
            ScrollView {
                VStack {
                    VStack(alignment: .leading) {
                        
                        ZStack {
                            AsyncImage(url: URL(string: product.image)) { phase in
                                switch phase {
                                case .empty:
                                    ProgressView()
                                case .success(let image):
                                    image
                                        .renderingMode(.original)
                                        .resizable()
                                        .scaledToFit()
                                        .aspectRatio(contentMode: .fit)
                                        .clipped()
                                case .failure(_):
                                    Text("Não foi possível carregar a imagem.")
                                @unknown default:
                                    EmptyView()
                                }
                            }
                            VStack(alignment: .trailing) {
                                HStack {
                                    Spacer()
                                    VStack {
                                        Spacer()
                                        if (product.onSale) {
                                            Text("-\(product.discountPercentage)")
                                                .foregroundColor(.black)
                                                .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                                                .background{
                                                    Color.green
                                                }
                                                .padding()
                                        }
                                    }
                                }
                            }
                        }
                        .frame(height: 310)
                        .frame(maxWidth: UIScreen.main.bounds.width)
                        .background(Color.white)
                        
                        VStack(alignment: .leading) {
                            
                            Text("\(product.name)")
                                .font(.title2)
                                .bold()
                            
                            HStack {
                                if (product.onSale) {
                                    Text("\(product.actualPrice)")
                                        .foregroundStyle(Color.green)
                                        .font(.title2)
                                        .fontWeight(.semibold)
                                    Text("\(product.regularPrice)")
                                        .strikethrough(true)
                                        .font(.system(size: 14))
                                } else {
                                    Text("\(product.regularPrice)")
                                        .font(.title2)
                                        .fontWeight(.semibold)
                                }
                            }
                            
                            Text("ou \(product.installments)")
                                .font(.caption)

                            
                            Button(action: {
                                shoppingCart.append(product)
                                self.presentationMode.wrappedValue.dismiss()
                            }) {
                                Label("Adicionar ao carrinho", systemImage: "cart.fill")
                            }
                            .buttonStyle(.bordered)
                            .padding(.top)
                        }.padding()
                    }
                }
            }
        }.navigationBarTitleDisplayMode(.inline)
    }
}




#Preview {
    ProductDetailsView(product: .constant(ProductApi.sampleData[2]), shoppingCart: .constant([]))
}
