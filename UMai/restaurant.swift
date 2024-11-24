//
//  restaurant.swift
//  UMai
//
//  Created by PeterPark on 10/11/24.
//

import Foundation

struct Restarurant: Identifiable {
    var id = UUID().uuidString
    var name: String
    var location: String
    var menu: [String]
    var Taste: Int
    var price: Int
    var quantity: Int
    var accessibility: Int
    var emotion: Int
    var description: String
    var foodImage: URL? // 나중에 사진을 URL로 연결
}

var allMenu = [exampleMenu1, exampleMenu2]

let exampleMenu1 = Restarurant(name: "Sushi JO", location: "서울 성동구 용답19길 4-1", menu: ["연어덮밥"], Taste: 4, price: 3, quantity: 2, accessibility: 5, emotion: 4, description: "Mr. Takione, who has been running a cost-effective restaurant for Hanyang University students for 10 years, came to this ambitious new project after hearing about it through word of mouth. The steamed clams are a harmonious combination of clams, mussels, oysters, and other seafood, and the soup has a mild flavor.")

let exampleMenu2 = Restarurant(name: "So Pheon", location: "사근동길45-17", menu: ["제육덮밥, 해장라면"], Taste: 5, price: 4, quantity: 3, accessibility: 3, emotion: 2, description: "제육덮밥은 한국에서 인기 있는 음식 중 하나로, 매콤한 고추장 양념에 돼지고기를 볶아 따뜻한 밥 위에 얹어 먹는 덮밥 요리입니다. ‘제육’은 돼지고기를 뜻하며, 고추장, 간장, 다진 마늘, 설탕, 참기름 등을 이용해 양념한 후, 양파, 대파, 당근 같은 야채와 함께 볶아 맛을 더합니다.")

//let exampleMenu3 = Restarurant(name: "오돈가스", location: <#T##String#>, menu: <#T##[String]#>, Taste: <#T##Int#>, price: <#T##Int#>, quantity: <#T##Int#>, accessibility: <#T##Int#>, emotion: <#T##Int#>, description: <#T##String#>)
//
//let exampleMenu4 = Restarurant(name: "북촌", location: <#T##String#>, menu: <#T##[String]#>, Taste: <#T##Int#>, price: <#T##Int#>, quantity: <#T##Int#>, accessibility: <#T##Int#>, emotion: <#T##Int#>, description: <#T##String#>)
//
//let exampleMenu5 = Restarurant(name: "봉평옹심이메밀칼국수", location: <#T##String#>, menu: <#T##[String]#>, Taste: <#T##Int#>, price: <#T##Int#>, quantity: <#T##Int#>, accessibility: <#T##Int#>, emotion: <#T##Int#>, description: <#T##String#>)
//
//let exampleMenu6 = Restarurant(name: "북촌묵은지삼겹살", location: <#T##String#>, menu: <#T##[String]#>, Taste: <#T##Int#>, price: <#T##Int#>, quantity: <#T##Int#>, accessibility: <#T##Int#>, emotion: <#T##Int#>, description: <#T##String#>)
//
//let exampleMenu7 = Restarurant(name: "로데로곱창", location: <#T##String#>, menu: <#T##[String]#>, Taste: <#T##Int#>, price: <#T##Int#>, quantity: <#T##Int#>, accessibility: <#T##Int#>, emotion: <#T##Int#>, description: <#T##String#>)
