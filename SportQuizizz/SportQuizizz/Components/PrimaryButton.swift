//
//  PrimaryButton.swift
//  SportQuizizz
//
//  Created by seif elshahet on 10/01/2024.
//

import SwiftUI

struct PrimaryButton: View {
    var text: String
    var background: Color = Color("AccentColor")
    var body: some View {
        Text(text)
            .padding()
            .padding(.horizontal)
            .foregroundColor(.white)
            .background(background)
            .cornerRadius(30)
            .shadow(radius: 10)
    }
}

#Preview {
    PrimaryButton(text: "Next")
}
