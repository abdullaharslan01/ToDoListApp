//
//  ItemModel.swift
//  ToDoApp
//
//  Created by abdullah on 13.06.2024.
//

import Foundation

struct ItemModel: Identifiable,Codable {
    let id: String
    let title: String
    let isComplated: Bool
    
    init(id:String = UUID().uuidString, title: String, isComplated: Bool) {
        self.id = id
        self.title = title
        self.isComplated = isComplated
    }
    
    func updateCompletion() -> ItemModel{
        return ItemModel(id: id, title: title, isComplated: !isComplated)
    }
    
}
