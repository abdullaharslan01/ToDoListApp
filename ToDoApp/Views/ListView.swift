//
//  ListView.swift
//  ToDoApp
//
//  Created by abdullah on 13.06.2024.
//

import SwiftUI


protocol addNewItemProtocol {
    func addItem(title:String)
}


struct ListView: View {

    @EnvironmentObject var listViewModel: ListViewModel
    
    
    var body: some View {
        
        ZStack{
         
            if listViewModel.items.isEmpty {
                NoItemsView()
                    .transition(.opacity.animation(.easeInOut))
            }
            else {
                List{
                  ForEach(listViewModel.items, id: \.id) { item in
                                ListRowView(item: item)
                                    .transition(.move(edge: .leading))
                                    .onTapGesture {
                withAnimation {
                     listViewModel.updateItem(item: item)
                                        }
                                    }
                                    
                            }
                           
                            .onDelete(perform: listViewModel.deleteItem)
                            .onMove(perform: listViewModel.moveItem)
                            
                        }
            }
            
            
        }
        .navigationTitle("To Do List App 📝")
        .toolbar(content: {
            ToolbarItem(placement:.topBarLeading) {
                EditButton()
            }
            
            ToolbarItem(placement: .topBarTrailing) {
                NavigationLink("Add", destination: AddView(delegate:self))

            }
        })
        
    }
    
    
    
    
}

extension ListView: addNewItemProtocol{
    func addItem(title: String) {
        
        DispatchQueue.main.asyncAfter(deadline: .now()+1) {
       
            withAnimation {
                        listViewModel.addItem(title: title)}
        }
        
       
        
    }
    
    
}



#Preview {
    NavigationStack{
        ListView()
        
    }
   
}
