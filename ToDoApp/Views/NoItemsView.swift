//
//  NoItemsView.swift
//  ToDoApp
//
//  Created by abdullah on 14.06.2024.
//

import SwiftUI

struct NoItemsView: View {
    
    let secondaryAccentColor = Color("SecondaryAccentColor")
    
    @State var animate: Bool = false
    var body: some View {
        ScrollView{
        
            VStack(spacing:10){
                Text("There are no items!")
                    .font(.title)
                    .fontWeight(.semibold)
                Text("Are you a productive person? I think you should click the add button and add a bunch of items to your todo list!")
                    .padding(.bottom, 20)
                NavigationLink(destination: AddView()) {
                    Text("Add Something")
                        .foregroundStyle(.white)
                        .font(.headline)
                        .frame(height: 55)
                        .frame(maxWidth: .infinity)
                        .background(animate ? secondaryAccentColor : .accentColor)
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                    
                }.padding(.horizontal, animate ? 30: 50)
                    .scaleEffect(animate ? 1.1 : 1.0)
                    .offset(y: animate ? -7: 0)
                    .shadow(color: animate ? secondaryAccentColor.opacity(0.7) : .accentColor.opacity(0.7), radius: animate ? 30: 10, x: 0.0, y: animate ? 50: 30)
                    
            }
            .frame(maxWidth: 400)
            .multilineTextAlignment(.center)
            .padding(40)
            .onAppear(perform:addAnimation)
        
        }.frame(maxWidth: .infinity, maxHeight: .infinity)
    }
    
    func addAnimation(){
        guard !animate else {return}
        
        DispatchQueue.main.asyncAfter(deadline: .now()+1.5) {
            
            withAnimation(Animation.easeInOut(duration: 2).repeatForever(autoreverses: true)) {
                animate.toggle()
            }
        }
    }
}

#Preview {
    NoItemsView()
}
