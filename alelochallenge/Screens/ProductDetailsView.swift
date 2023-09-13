//
//  ProductDetailsView.swift
//  alelochallenge
//
//  Created by Marcus Vinicius Pereira on 10/09/23.
//

import SwiftUI

struct ProductDetailsView: View {
    @Binding var product: ProductApi
    @Binding var shoppingCart: [productCart]
    @State private var selectedSizeIndex = 0
    @Environment(\.presentationMode) var presentationMode
    
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

                            VStack(alignment: .leading) {
                                Text("Selecione o tamanho: ")
                                Picker("Sizes", selection: $selectedSizeIndex) {
                                    ForEach(0..<product.availableSizes().count, id: \.self) { index in
                                        Text(product.availableSizes()[index].size).tag(index)
                                    }
                                }.pickerStyle(SegmentedPickerStyle())
                            }
                            
                            Button(action: {
                                if let index = shoppingCart.firstIndex(where: {$0.productId == product.codeColor &&  $0.size == product.availableSizes()[selectedSizeIndex].size}) {
                                    shoppingCart[index].quantity = shoppingCart[index].quantity + 1
                                } else {
                                    shoppingCart.append(
                                        productCart(sku: product.availableSizes()[selectedSizeIndex].sku,
                                            quantity: 1,
                                            size: product.availableSizes()[selectedSizeIndex].size,
                                            productId: product.codeColor)
                                    )
                                }
                                print(shoppingCart)
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



/*
#Preview {
    ProductDetailsView(product: .constant(ProductApi.sampleData[2]), shoppingCart: .constant([]))
}
*/
