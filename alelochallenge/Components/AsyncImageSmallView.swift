//
//  AsyncImageSmallView.swift
//  alelochallenge
//
//  Created by Marcus Vinicius Pereira on 14/09/23.
//

import SwiftUI

struct AsyncImageSmallView: View {
    var imageUrl: String
    
    var body: some View {
        AsyncImage(url: URL(string: imageUrl)) { phase in
            switch phase {
            case .success(let image):
                image
                    .resizable()
                    .scaledToFit()
            case .failure(_):
                Color.red
            default:
                Color.white
            }
        }

    }
}

#Preview {
    AsyncImageSmallView(imageUrl: Product.productsMock[0].image)
}
