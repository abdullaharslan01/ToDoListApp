//
//  ToDoAppApp.swift
//  ToDoApp
//
//  Created by abdullah on 13.06.2024.
//

import SwiftUI

@main
struct ToDoAppApp: App {
    
  @StateObject  var listViewModel: ListViewModel = ListViewModel()
    
    
    var body: some Scene {
        WindowGroup {
            NavigationStack{
                ListView()
            }
            .environmentObject(listViewModel)
        }
        
    }
}
