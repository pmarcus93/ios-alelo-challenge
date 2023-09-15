//
//  ImageLoaderSmallView.swift
//  alelochallenge
//
//  Created by Marcus Vinicius Pereira on 15/09/23.
//

import SwiftUI

struct ImageLoaderSmallView: View {
    var imageUrl: String
        
    var body: some View {
        ZStack {
            if (imageUrl.isEmpty) {
                NoImageSmallView()
            } else {
                AsyncImageSmallView(imageUrl: imageUrl)
            }
        }
        .frame(width: 75, height: 75)
        .background(Color.white)
    }
}

#Preview {
    ImageLoaderSmallView(imageUrl: Product.productsMock[1].image)
}
