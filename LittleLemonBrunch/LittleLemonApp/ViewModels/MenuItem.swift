//
//  MenuItem.swift
//  LittleLemonApp
//
//  Created by Maria Tkachenkova on 01.12.2023.
//

import Foundation

struct MenuItem: Decodable, Identifiable {
    var id = UUID()
    let title: String
    let image: String
    let price: String
    let description: String
    let category: String
    
    enum CodingKeys: String, CodingKey {
        case title = "title"
        case description = "description"
        case price = "price"
        case image = "image"
        case category = "category"
    }
}
