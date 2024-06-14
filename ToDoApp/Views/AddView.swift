//
//  AddView.swift
//  ToDoApp
//
//  Created by abdullah on 13.06.2024.
//

import SwiftUI

struct AddView: View {
    
    
    var delegate: addNewItemProtocol?
    
    @Environment(\.dismiss) var dismiss
    @State var textFieldText: String = ""
    @State var alertTitle: String = ""
    @State var showAlert: Bool  = false
    
    var body: some View {
        
        ScrollView{

            VStack {
                TextField("Title", text: $textFieldText)
                    .padding(.horizontal)
                    .frame(height: 55)
                    .background(.gray.opacity(0.3))
                .clipShape(RoundedRectangle(cornerRadius: 10))
                
                Button(action: saveButtonPressed , label: {
                    Text("Add")
                        .foregroundStyle(.white)
                        .font(.headline)
                        .frame(height: 55)
                        .frame(maxWidth: .infinity)
                        .background(Color(UIColor.secondarySystemBackground))
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                })
            }
            .padding(15)
            .alert(alertTitle, isPresented: $showAlert) {
                Button("OK") {
                    showAlert.toggle()
                }
            }
                

        }
        .navigationTitle("Add an Item")
        
        
    }
    
    func saveButtonPressed(){

        if textIsAppropriate(){
            delegate?.addItem(title: textFieldText)
            dismiss()
        }
        else {
            
            showAlert.toggle()
        }
        
       
    }
 
    func textIsAppropriate()->Bool{
        
        if textFieldText.count < 3 {
            alertTitle = "Your new todo item must be at least 3 characters long!!."
            return false
        }
        
        return true
        
    }
    
    
}

#Preview {
    NavigationStack{
        AddView()
    }
}
