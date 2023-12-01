//
//  MenuCategory.swift
//  LittleLemonApp
//
//  Created by Maria Tkachenkova on 01.12.2023.
//

import Foundation

struct CategoryItem: Codable,Identifiable {
    let id = UUID()
    let itemName: String
    let category: String
}

struct MenuData: Codable {
    let menu: [CategoryItem]
}
