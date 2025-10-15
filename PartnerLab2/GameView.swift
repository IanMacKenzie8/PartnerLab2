import SwiftUI

struct GameView: View {
    @StateObject private var vm = GameViewModel()

    private let columns = [
        GridItem(.flexible(), spacing: 14),
        GridItem(.flexible(), spacing: 14),
        GridItem(.flexible(), spacing: 14)
    ]

    var body: some View {
        ZStack {
            LinearGradient(
                colors: [Color.dusk, Color.cedar, Color.maple, Color.pumpkin],
                startPoint: .topLeading,
                endPoint: .bottomTrailing
            )
            .ignoresSafeArea()

            VStack(spacing: 18) {
                TitleBar(moves: vm.moves, pairs: vm.pairsFound, total: vm.totalPairs)

                ScrollView {
                    LazyVGrid(columns: columns, spacing: 14) {
                        ForEach(vm.cards) { card in
                            CardView(card: card)
                                .aspectRatio(2/3, contentMode: .fit)
                                .onTapGesture { vm.flip(card) }
                                .accessibilityLabel(Text(card.isFaceUp || card.isMatched ? card.emoji : "Covered card"))
                                .accessibilityAddTraits(.isButton)
                        }
                    }
                    .padding(.horizontal, 16)
                    .padding(.top, 4)
                }

                Button {
                    withAnimation(.spring(response: 0.35, dampingFraction: 0.8)) {
                        vm.restart()
                    }
                } label: {
                    Label("Restart", systemImage: "arrow.clockwise")
                        .fontWeight(.semibold)
                        .padding(.horizontal, 22)
                        .padding(.vertical, 12)
                        .background(
                            Capsule().fill(Color.wheat.opacity(0.95))
                                .shadow(color: Color.dusk.opacity(0.35), radius: 10, y: 6)
                        )
                        .foregroundStyle(Color.dusk)
                        .overlay(
                            Capsule().stroke(Color.dusk.opacity(0.15), lineWidth: 1)
                        )
                }
                .padding(.bottom, 10)
            }
        }
        .navigationTitle("")
    }
}

private struct TitleBar: View {
    let moves: Int
    let pairs: Int
    let total: Int

    var body: some View {
        HStack(spacing: 12) {
            Text("Autumn Match 🍂")
                .font(.system(size: 28, weight: .bold, design: .rounded))
                .foregroundStyle(Color.wheat)
                .shadow(color: Color.dusk.opacity(0.6), radius: 8, y: 3)

            Spacer()

            HStack(spacing: 10) {
                Label("\(moves)", systemImage: "hand.tap")
                Divider().frame(height: 16).background(Color.dusk.opacity(0.25))
                Label("\(pairs)/\(total)", systemImage: "rectangle.on.rectangle.angled")
            }
            .font(.subheadline.weight(.semibold))
            .padding(.horizontal, 14)
            .padding(.vertical, 8)
            .background(Color.wheat.opacity(0.95), in: Capsule())
            .overlay(Capsule().stroke(Color.dusk.opacity(0.15), lineWidth: 1))
            .foregroundStyle(Color.dusk)
        }
        .padding(.horizontal, 16)
        .padding(.top, 10)
    }
}

#Preview { GameView() }
