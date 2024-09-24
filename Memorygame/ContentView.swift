//
//  ContentView.swift
//  Memorygame
//
//  Created by Vaishal Dhir on 2024-09-21.
//

import SwiftUI

struct ContentView: View {
    let emojis: Array<String> = ["👻", "🎃", "👽", "😈", "🫣"] // Defining array to store emojis for the game.
    var body: some View {
        HStack {
            //indices means Range
            ForEach (emojis.indices, id:\.self) { index in
                CardView(content: emojis[index])
                
            }
            // Using ForEach instead of writing again and again.
//            CardView(content: "👻")
//            CardView(content: "🎃")
//            CardView(content: "👽")
//            CardView(content: "😈")
        }.foregroundColor(.orange)
       
        .padding()
    }
}

struct CardView: View {
    // State creates a pointer towards isFaceUp. Has to do with the displaying not with the actual app.
    let content: String
    @State var isFaceUp: Bool = false          // Can also remove Bool as swift is a strongly typed language.
    let base = RoundedRectangle(cornerRadius: 12) // Gave roundedRectangle to base as it will be easy and looks good.
    var body: some View {
        ZStack (content:  {
            if isFaceUp{
                base.foregroundColor(.white)
                base.strokeBorder(lineWidth: 4)
                Text(content).font(.largeTitle)
            }
            else {
                base.fill()
            }
        }
        ).onTapGesture {                // to add tap on the screen
            isFaceUp.toggle()           // toggle means to flip
        }
    }
}


#Preview {
    ContentView()
}
