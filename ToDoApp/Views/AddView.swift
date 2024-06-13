//
//  AddView.swift
//  ToDoApp
//
//  Created by abdullah on 13.06.2024.
//

import SwiftUI

struct AddView: View {
    
    @State var textFieldText: String = ""
    
    var body: some View {
        
        ScrollView{

            VStack {
                TextField("Title", text: $textFieldText)
                    .padding(.horizontal)
                    .frame(height: 55)
                    .background(.gray.opacity(0.3))
                .clipShape(RoundedRectangle(cornerRadius: 10))
                
                Button(action: {}, label: {
                    Text("Add")
                        .foregroundStyle(.white)
                        .font(.headline)
                        .frame(height: 55)
                        .frame(maxWidth: .infinity)
                        .background(Color.accentColor)
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                })
            }
            .padding(15)
                

        }
        .navigationTitle("Add an Item")
        
    }
}

#Preview {
    NavigationStack{
        AddView()
    }
}
