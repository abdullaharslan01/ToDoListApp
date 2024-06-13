//
//  ItemModel.swift
//  ToDoApp
//
//  Created by abdullah on 13.06.2024.
//

import Foundation

struct ItemModel: Identifiable {
    let id: String = UUID().uuidString
    var title: String
    var isComplated: Bool
    
}
