//
//  Card.swift
//  PartnerLab2
//
//  Created by cisstudent on 10/14/25.
//


// ===============================

// FILE: Card.swift

// ===============================

// Partner Lab# 2

// Group# 3

// Names: Hasan Dababo, Ian Mackenzie

// Date: 10/10/2025

// Description: Memory card game that is fall themed!



import Foundation



struct Card: Identifiable {

    let id: UUID = UUID()

    let emoji: String // could be an image name instead if using Assets

    var isFaceUp: Bool = false

    var isMatched: Bool = false

}