//
//  ListRowView.swift
//  ToDoApp
//
//  Created by abdullah on 13.06.2024.
//

import SwiftUI

struct ListRowView: View {
    var item: ItemModel
    
    var body: some View {
        HStack{
            Image(systemName: item.isComplated ? "checkmark.circle.fill": "checkmark.circle")
                .foregroundStyle(item.isComplated ? .green : .red)
            Text("\(item.title)")
          Spacer()
        }
        .font(.title2)
        .padding(.vertical,8)
    }
}
