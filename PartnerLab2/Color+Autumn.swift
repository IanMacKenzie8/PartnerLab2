// Partner Lab# 2

// Group# 3

// Names: Hasan Dababo, Ian Mackenzie

// Date: 10/10/2025


import SwiftUI

// makes it easier to create custom colors using RGB values

extension Color {

    static func autumn(_ r: Double, _ g: Double, _ b: Double) -> Color {

        Color(.sRGB, red: r/255, green: g/255, blue: b/255, opacity: 1)

    }



    static let pumpkin = Color.autumn(232,115,34)

    static let maple   = Color.autumn(179,57,33)

    static let cedar   = Color.autumn(103,66,53)

    static let wheat   = Color.autumn(248,241,229)

    static let sage    = Color.autumn(165,186,141)

    static let dusk    = Color.autumn(49,31,26)

}

