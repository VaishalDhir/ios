//
//  ContentView.swift
//  Memorygame
//
//  Created by Vaishal Dhir on 2024-09-21.
//

import SwiftUI

struct ContentView: View {
    let emojis/*:*/ /*Array<String>*/ = ["👻", "🎃", "👽", "😈", "🫣", "👻", "🎃", "👽", "😈", "🫣"] // Defining array to store emojis for the game.
    @State var cardCount: Int = 4
    var body: some View {
        VStack{
            ScrollView{
                cards
            }
            Spacer()
            cardCountAdjusters
           
                    .imageScale(.large)
                    .font(.largeTitle)
        }
       
        .padding()
    }
    
    
    var cards : some View{
        LazyVGrid(columns: [GridItem(.adaptive(minimum: 120))]) {
            /*emojis.indices*/
            //indices means Range
            ForEach (0..<cardCount, id:\.self) { index in
                CardView(content: emojis[index])
                    .aspectRatio(2/3, contentMode: .fit)
            }
            
            
            // Using ForEach instead of writing again and again.
            //            CardView(content: "👻")
            //            CardView(content: "🎃")
            //            CardView(content: "👽")
            //            CardView(content: "😈")
        }.foregroundColor(.orange)
    }
    
    func cardCountAdjuster(by offset: Int, symbol: String) -> some View{
        Button(action: {
            cardCount += offset
        }, label: {
            Image(systemName: symbol)
        }
        )
        .disabled(cardCount + offset < 1 || cardCount + offset > emojis.count)
        
    }
    
    var cardRemover : some View{
        cardCountAdjuster(by: -1, symbol: "rectangle.stack.fill.badge.minus")
//        Button(action:{
//            if cardCount > 1 {
//                cardCount -= 1
//            }
//            
//        }, label: {
//            Image(systemName: "rectangle.stack.fill.badge.minus")
//        })
        }
    
    
    var cardAdder : some View{
        cardCountAdjuster(by: +1, symbol: "rectangle.stack.fill.badge.plus" )
        }
    
    var cardCountAdjusters : some View{
        HStack {
            cardRemover
            Spacer()
            cardAdder
            
            }
    }
}

struct CardView: View {
    // State creates a pointer towards isFaceUp. Has to do with the displaying not with the actual app.
    let content: String
    @State var isFaceUp: Bool = false          // Can also remove Bool as swift is a strongly typed language.
    let base = RoundedRectangle(cornerRadius: 12) // Gave roundedRectangle to base as it will be easy and looks good.
    var body: some View {
        ZStack (content:  {
            Group{
                base.foregroundColor(.white)
                base.strokeBorder(lineWidth: 4)
                Text(content).font(.largeTitle)
            }
            .opacity(isFaceUp ? 1 : 0)
            base.fill().opacity(isFaceUp ? 0 : 1)
        }
        ).onTapGesture {                // to add tap on the screen
            isFaceUp.toggle()           // toggle means to flip
        }
    }
}


#Preview {
    ContentView()
}
