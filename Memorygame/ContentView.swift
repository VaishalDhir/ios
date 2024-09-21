//
//  ContentView.swift
//  Memorygame
//
//  Created by Vaishal Dhir on 2024-09-21.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        HStack {
            CardView(isFaceUp: true)
            CardView()
            CardView()
            CardView()
        }.foregroundColor(.orange)
       
        .padding()
    }
}

struct CardView: View {
    var isFaceUp: Bool = false
    var body: some View {
        ZStack (content:  {
            if isFaceUp{
                RoundedRectangle(cornerRadius: 12).foregroundColor(.white)
                RoundedRectangle(cornerRadius: 12).strokeBorder(lineWidth: 4)
                Text("👻").font(.largeTitle)
            }
            else {
                RoundedRectangle(cornerRadius: 12)
            }
            
        }
   ) }
}


#Preview {
    ContentView()
}
