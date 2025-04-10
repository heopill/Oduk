//
//  ProductDataManager.swift
//  Oduk
//
//  Created by 최영락 on 4/10/25.
//

import Foundation

enum ProductCategory: Int {
    case figure = 0
    case tshirt
    case keyring
    case pillow
}

struct ProductManager {
    static func getProducts (_ category: ProductCategory) -> [ProductModel] {
        switch category {
        case .figure:
            return [
                ProductModel(name: "피규어", backgroundColor: .white, imageName: "피규어", price: "3000원"),
                ProductModel(name: "피규어", backgroundColor: .white, imageName: "피규어", price: "3000원"),
                ProductModel(name: "피규어", backgroundColor: .white, imageName: "피규어", price: "3000원"),
                ProductModel(name: "피규어", backgroundColor: .white, imageName: "피규어", price: "3000원"),
                ProductModel(name: "피규어", backgroundColor: .white, imageName: "피규어", price: "3000원"),
                ProductModel(name: "피규어", backgroundColor: .white, imageName: "피규어", price: "3000원"),
                ProductModel(name: "피규어", backgroundColor: .white, imageName: "피규어", price: "3000원"),
                ProductModel(name: "피규어", backgroundColor: .white, imageName: "피규어", price: "3000원")
            ]
        case .tshirt:
            return [
                ProductModel(name: "티셔츠", backgroundColor: .white, imageName: "피규어", price: "3000원"),
                ProductModel(name: "티셔츠", backgroundColor: .white, imageName: "피규어", price: "3000원"),
                ProductModel(name: "티셔츠", backgroundColor: .white, imageName: "피규어", price: "3000원"),
                ProductModel(name: "티셔츠", backgroundColor: .white, imageName: "피규어", price: "3000원")
            ]
        case .keyring:
            return [
                ProductModel(name: "키링", backgroundColor: .white, imageName: "피규어", price: "3000원"),
                ProductModel(name: "키링", backgroundColor: .white, imageName: "피규어", price: "3000원"),
                ProductModel(name: "키링", backgroundColor: .white, imageName: "피규어", price: "3000원"),
                ProductModel(name: "키링", backgroundColor: .white, imageName: "피규어", price: "3000원")
            ]
        case .pillow:
            return [
                ProductModel(name: "베개", backgroundColor: .white, imageName: "피규어", price: "3000원"),
                ProductModel(name: "베개", backgroundColor: .white, imageName: "피규어", price: "3000원"),
                ProductModel(name: "베개", backgroundColor: .white, imageName: "피규어", price: "3000원"),
                ProductModel(name: "베개", backgroundColor: .white, imageName: "피규어", price: "3000원")
            ]
            
        }
    }
}
