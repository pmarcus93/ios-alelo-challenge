//
//  ProductApi.swift
//  alelochallenge
//
//  Created by Marcus Vinicius Pereira on 10/09/23.
//

import Foundation

struct Product: Codable {
    let name: String
    let style: String
    let codeColor: String
    let colorSlug: String
    let color: String
    let onSale: Bool
    let regularPrice: String
    let actualPrice: String
    let discountPercentage: String
    let installments: String
    let image: String
    let sizes: [Size]
    
    enum CodingKeys: String, CodingKey {
        case name
        case style
        case codeColor = "code_color"
        case colorSlug = "color_slug"
        case color
        case onSale = "on_sale"
        case regularPrice = "regular_price"
        case actualPrice = "actual_price"
        case discountPercentage = "discount_percentage"
        case installments
        case image
        case sizes
    }
    
    func availableSizes() -> [Size] {
        return sizes.map { size in
            return Size(
                available: size.available,
                size: size.size,
                sku: size.sku,
                productId: self.colorSlug
            )
        }.filter { $0.available == true }
    }
}

struct Size: Codable {
    let available: Bool
    let size: String
    let sku: String
    let productId: String?
}

struct ProductResponse: Codable {
    let products: [Product]
}

struct ProductShoppingCart {
    var sku: String
    var quantity: Int
    var size: String
    var productId: String
}


extension Product {
    static let productsMock: [Product] = [
        Product(
            name: "VESTIDO TRANSPASSE BOW",
            style: "20002605",
            codeColor: "20002605_613",
            colorSlug: "ABC",
            color: "TAPEÇARIA",
            onSale: false,
            regularPrice: "R$ 199,90",
            actualPrice: "R$ 199,90",
            discountPercentage: "",
            installments: "3x R$ 66,63",
            image: "https://d3l7rqep7l31az.cloudfront.net/images/products/20002605_615_catalog_1.jpg?1460136912",
            sizes: [
                Size(available: false, size: "PP", sku: "5807_343_0_PP", productId: "20002605_613"),
                Size(available: true, size: "P", sku: "5807_343_0_P", productId: "20002605_613"),
                Size(available: false, size: "M", sku: "5807_343_0_M", productId: "20002605_613"),
                Size(available: false, size: "G", sku: "5807_343_0_G", productId: "20002605_613"),
                Size(available: false, size: "GG", sku: "5807_343_0_GG", productId: "20002605_613"),
            ]
        ),
        Product(
            name: "REGATA ALCINHA FOLK",
            style: "20002570",
            codeColor: "20002570_612",
            colorSlug: "off-white",
            color: "OFF WHITE",
            onSale: false,
            regularPrice: "R$ 99,90",
            actualPrice: "R$ 99,90",
            discountPercentage: "",
            installments: "3x R$ 33,30",
            image: "https://d3l7rqep7l31az.cloudfront.net/images/products/20002570_002_catalog_1.jpg?1459948578",
            sizes: [
                Size(available: true, size: "PP", sku: "5723_1000058_0_PP", productId: "20002570_614"),
                Size(available: false, size: "P", sku: "5723_1000058_0_PP", productId: "20002570_614"),
                Size(available: true, size: "M", sku: "5723_1000058_0_PP", productId: "20002570_614"),
                Size(available: true, size: "G", sku: "5723_1000058_0_PP", productId: "20002570_614"),
                Size(available: true, size: "GG", sku: "5723_1000058_0_PP", productId: "20002570_614"),
            ]
        ),
        Product(
            name: "T-SHIRT LEATHER DULL",
            style: "20002602",
            codeColor: "20002602_027",
            colorSlug: "marinho",
            color: "MARINHO",
            onSale: true,
            regularPrice: "R$ 139,90",
            actualPrice: "R$ 119,90",
            discountPercentage: "12%",
            installments: "3x R$ 39,97",
            image: "",
            sizes: [
                Size(available: true, size: "PP", sku: "5793_1000032_0_PP", productId: "20002602_027"),
                Size(available: true, size: "P", sku: "5793_1000032_0_P", productId: "20002602_027"),
                Size(available: false, size: "M", sku: "5793_1000032_0_M", productId: "20002602_027"),
                Size(available: false, size: "G", sku: "5793_1000032_0_G", productId: "20002602_027"),
                Size(available: false, size: "GG", sku: "5793_1000032_0_GG", productId: "20002602_027"),
            ]
        ),
    ]

    static let shoppingCartMock: [ProductShoppingCart] = [
        ProductShoppingCart(sku: "5807_343_0_P", quantity: 3, size: "P", productId: "20002605_613"),
        ProductShoppingCart(sku: "5723_1000058_0_G", quantity: 1, size: "G", productId: "20002570_614"),
        ProductShoppingCart(sku: "5793_1000032_0_PP", quantity: 5, size: "PP", productId: "20002602_027")
    ]
}

