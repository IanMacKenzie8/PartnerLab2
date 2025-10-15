// Partner Lab# 2

// Group# 3

// Names: Hasan Dababo, Ian Mackenzie

// Date: 10/10/2025

import SwiftUI



struct CardView: View {

    let card: Card



    var body: some View {

        ZStack {

            RoundedRectangle(cornerRadius: 18, style: .continuous)

                .fill((card.isFaceUp || card.isMatched) ? Color.wheat : Color.pumpkin)

                .overlay(

                    RoundedRectangle(cornerRadius: 18, style: .continuous)

                        .strokeBorder(.white.opacity(card.isFaceUp ? 0.7 : 0.15), lineWidth: card.isFaceUp ? 1.5 : 1)

                )

                .shadow(color: Color.dusk.opacity(0.35), radius: 8, y: 6)



            if !card.isFaceUp && !card.isMatched {

                RoundedRectangle(cornerRadius: 18, style: .continuous)

                    .fill(

                        LinearGradient(colors: [Color.white.opacity(0.18), .clear],

                                       startPoint: .topLeading, endPoint: .bottomTrailing)

                    )

                    .padding(2)

            }



            Text(card.isFaceUp || card.isMatched ? card.emoji : "🍁")

                .font(.system(size: 44))

                .scaleEffect(card.isMatched ? 1.1 : 1)

                .opacity(card.isMatched ? 0.65 : 1)

                .animation(.spring(response: 0.4, dampingFraction: 0.7), value: card.isMatched)

        }

        .padding(4)

        .rotation3DEffect(.degrees(card.isFaceUp || card.isMatched ? 0 : 180), axis: (x: 0, y: 1, z: 0))

        .animation(.easeInOut(duration: 0.28), value: card.isFaceUp)

    }

}



#Preview {

    VStack {

        CardView(card: Card(emoji: "🎃", isFaceUp: true))

            .frame(width: 120, height: 180)

        CardView(card: Card(emoji: "🦊", isFaceUp: false))

            .frame(width: 120, height: 180)

    }

    .padding()

    .background(

        LinearGradient(colors: [Color.dusk, Color.maple, Color.pumpkin],

                       startPoint: .top, endPoint: .bottom)

    )

}
