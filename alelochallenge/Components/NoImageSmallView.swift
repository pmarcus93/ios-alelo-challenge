//
//  NoImageSmallView.swift
//  alelochallenge
//
//  Created by Marcus Vinicius Pereira on 14/09/23.
//

import SwiftUI

struct NoImageSmallView: View {
    var body: some View {
        Image(systemName: "camera.on.rectangle.fill")
            .resizable()
            .aspectRatio(contentMode: .fit)
            .frame(width: 25, height: 25)
            .foregroundColor(.gray)
            .padding()
    }
}

#Preview {
    NoImageSmallView()
}
