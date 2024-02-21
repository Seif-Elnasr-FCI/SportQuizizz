//
//  Answer.swift
//  SportQuizizz
//
//  Created by seif elshahet on 10/01/2024.
//

import Foundation

struct Answer: Identifiable {
    var id = UUID()
    var text: AttributedString
    var isCorrect: Bool
}
