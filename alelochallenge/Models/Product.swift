//
//  ProdutoModel.swift
//  alelochallenge
//
//  Created by Marcus Vinicius Pereira on 10/09/23.
//

import Foundation

struct Product: Identifiable {
    let id: UUID
    var name: String
    var style: String
    var codeColor: String
    var color: String
    var onSale: Bool
    var regularPrice: String
    var actualPrice: String
    var discountPercentage: String
    var installments: String
    var image: String
    var sizes: [Size]
    
    init(id: UUID = UUID(), name: String, style: String, codeColor: String, color: String, onSale: Bool, regularPrice: String, actualPrice: String, discountPercentage: String, installments: String, image: String, sizes: [Size]) {
        self.id = id
        self.name = name
        self.style = style
        self.codeColor = codeColor
        self.color = color
        self.onSale = onSale
        self.regularPrice = regularPrice
        self.actualPrice = actualPrice
        self.discountPercentage = discountPercentage
        self.installments = installments
        self.image = image
        self.sizes = sizes
    }
}

extension Product {
    struct Size: Identifiable {
        let id: UUID
        var avaiable: Bool
        var size: String
        var sku: String
        
        init(id: UUID = UUID(), avaiable: Bool, size: String, sku: String) {
            self.id = id
            self.avaiable = avaiable
            self.size = size
            self.sku = sku
        }
    }
}

extension Product {
    static let sampleData: [Product] = [
        Product(
            name: "VESTIDO TRANSPASSE BOW", 
            style: "20002605", 
            codeColor: "20002605_613", 
            color: "TAPEÇARIA", 
            onSale: false, 
            regularPrice: "R$ 199,90", 
            actualPrice: "R$ 199,90", 
            discountPercentage: "", 
            installments: "3x R$ 66,63", 
            image: "https://d3l7rqep7l31az.cloudfront.net/images/products/20002605_615_catalog_1.jpg?1460136912",
            sizes: [
                Size(avaiable: false, size: "PP", sku: "5807_343_0_PP"),
                Size(avaiable: true, size: "P", sku: "5807_343_0_P"),
                Size(avaiable: false, size: "M", sku: "5807_343_0_M"),
                Size(avaiable: false, size: "G", sku: "5807_343_0_G"),
                Size(avaiable: false, size: "GG", sku: "5807_343_0_GG"),
            ]
        ),
        Product(
            name: "REGATA ALCINHA FOLK", 
            style: "20002570", 
            codeColor: "20002570_614", 
            color: "PRETO", 
            onSale: false, 
            regularPrice: "R$ 99,90", 
            actualPrice: "R$ 99,90", 
            discountPercentage: "", 
            installments: "3x R$ 33,30", 
            image: "https://d3l7rqep7l31az.cloudfront.net/images/products/20002570_002_catalog_1.jpg?1459948578",
            sizes: [
                Size(avaiable: false, size: "PP", sku: "5807_343_0_PP"),
                Size(avaiable: true, size: "P", sku: "5807_343_0_P"),
                Size(avaiable: false, size: "M", sku: "5807_343_0_M"),
                Size(avaiable: false, size: "G", sku: "5807_343_0_G"),
                Size(avaiable: false, size: "GG", sku: "5807_343_0_GG"),
            ]
        ),
        Product(
            name: "T-SHIRT LEATHER DULL", 
            style: "20002602", 
            codeColor: "20002602_027", 
            color: "MARINHO", 
            onSale: true, 
            regularPrice: "R$ 139,90", 
            actualPrice: "R$ 119,90", 
            discountPercentage: "12%", 
            installments: "3x R$ 39,97", 
            image: "",
            sizes: [
                Size(avaiable: false, size: "PP", sku: "5807_343_0_PP"),
                Size(avaiable: true, size: "P", sku: "5807_343_0_P"),
                Size(avaiable: false, size: "M", sku: "5807_343_0_M"),
                Size(avaiable: false, size: "G", sku: "5807_343_0_G"),
                Size(avaiable: false, size: "GG", sku: "5807_343_0_GG"),
            ]
        ),
    ]
}
