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
                ProductModel(name: "고독한 영라기", backgroundColor: .white, imageName: "영락피규어", price: "3000원"),
                ProductModel(name: "수줍은 원시기", backgroundColor: .white, imageName: "원식피규어", price: "4000원"),
                ProductModel(name: "배고픈 다서이", backgroundColor: .white, imageName: "다성피규어", price: "2500원"),
                ProductModel(name: "정열의 성피리", backgroundColor: .white, imageName: "성필피규어", price: "3500원"),
                ProductModel(name: "보아핸콕 피규어", backgroundColor: .white, imageName: "보아핸콕피규어", price: "9000원"),
                ProductModel(name: "조로 피규어", backgroundColor: .white, imageName: "조로피규어", price: "9000원"),
                ProductModel(name: "하츠네미쿠 피규어", backgroundColor: .white, imageName: "하츠네미쿠피규어", price: "8000원"),
                ProductModel(name: "세이버 피규어", backgroundColor: .white, imageName: "페이트피규어", price: "8000원")
            ]
        case .tshirt:
            return [
                ProductModel(name: "고독한 영락티", backgroundColor: .white, imageName: "영락티", price: "7500원"),
                ProductModel(name: "수줍은 원식티", backgroundColor: .white, imageName: "원식티", price: "6500원"),
                ProductModel(name: "배고픈 다성티", backgroundColor: .white, imageName: "다성티", price: "8000원"),
                ProductModel(name: "정열의 성필티", backgroundColor: .white, imageName: "성필티", price: "7000원"),
                ProductModel(name: "강한 사람 티", backgroundColor: .white, imageName: "강자티", price: "8000원"),
                ProductModel(name: "구해주세요 티", backgroundColor: .white, imageName: "구해주세요티", price: "7000원"),
                ProductModel(name: "페이트 티", backgroundColor: .white, imageName: "페이트티", price: "9000원"),
                ProductModel(name: "사스케 티", backgroundColor: .white, imageName: "사스케티", price: "9000원")
            ]
        case .keyring:
            return [
                ProductModel(name: "피곤한 영라키링", backgroundColor: .white, imageName: "영락키링", price: "2500원"),
                ProductModel(name: "수줍은 원시키링", backgroundColor: .white, imageName: "원식키링", price: "2500원"),
                ProductModel(name: "배고픈 다성키링", backgroundColor: .white, imageName: "다성키링", price: "2500원"),
                ProductModel(name: "정열의 성필키링", backgroundColor: .white, imageName: "성필키링", price: "2500원")
            ]
        case .pillow:
            return [
                ProductModel(name: "찡긋 영락베개", backgroundColor: .white, imageName: "영락베개", price: "8500원"),
                ProductModel(name: "살만한 원식베개", backgroundColor: .white, imageName: "원식베개", price: "8500원"),
                ProductModel(name: "이상한 다성베개", backgroundColor: .white, imageName: "다성베개", price: "8500원"),
                ProductModel(name: "부끄 성필베개", backgroundColor: .white, imageName: "성필베개", price: "10억원")
            ]
            
        }
    }
}
