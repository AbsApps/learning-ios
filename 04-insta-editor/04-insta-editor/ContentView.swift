//
//  ContentView.swift
//  04-insta-editor
//
//  Created by Christian Rizo on 3/28/24.
//

import SwiftUI

struct ContentView: View {
    
    @State private var selectedColor =  Color.white
    
    let allColor: [Color] = [.pink, .red, .orange, .yellow, .green, .mint, .teal, .cyan, .blue, .indigo, .purple, .brown, .gray]


    
    private var gridItemLayout = [GridItem(.flexible())]


    
    var body: some View {
  
        
        VStack{
            Text("Insta Editor")
            Image("chica").resizable().aspectRatio(contentMode: .fit).colorMultiply(selectedColor)
            
            ScrollView(.horizontal) {
                LazyHGrid(rows: gridItemLayout, spacing: 20) {
                    ForEach(allColor.indices, id:\.self) { index in
                        Button {
                            selectedColor = allColor[index]
                        } label: {
                            RoundedRectangle(cornerRadius: 5.0).aspectRatio(1.0, contentMode: /*@START_MENU_TOKEN@*/.fill/*@END_MENU_TOKEN@*/).overlay(Text("hola")).foregroundColor(allColor[index])
     
                        }
                   }
                }
            }.frame(height: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/)
                .padding(5)
        
        }
    }
}

#Preview {
    ContentView()
}
