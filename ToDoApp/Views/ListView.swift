//
//  ListView.swift
//  ToDoApp
//
//  Created by abdullah on 13.06.2024.
//

import SwiftUI

struct ListView: View {

    @State var items: [ItemModel] = [
    ItemModel(title: "First Item", isComplated: false),
    ItemModel(title: "Second Item", isComplated: true),
    ItemModel(title: "Third Item", isComplated: true),
    ItemModel(title: "Forth Item", isComplated: false)
    
    ]
    
    var body: some View {
        List{
            ForEach(items, id: \.id) { item in
        
                    
                ListRowView(item: item)
            }
            
        }
        .navigationTitle("To Do List App 📝")
        .toolbar(content: {
            ToolbarItem(placement:.topBarLeading) {
                EditButton()
            }
            
            ToolbarItem(placement: .topBarTrailing) {
              NavigationLink("Add", destination: AddView())

            }
        })
        
    }
}

#Preview {
    NavigationStack{
        ListView()

    }
}
