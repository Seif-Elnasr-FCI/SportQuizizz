//
//  ContentView.swift
//  SportQuizizz
//
//  Created by seif elshahet on 09/01/2024.
//

import SwiftUI

struct ContentView: View {
    @StateObject var quizManager = QuizManager()
    var body: some View {
        NavigationStack {
            
            VStack(spacing: 40) {
                
                VStack(spacing: 20) {
                    
                    Text("Sport Quizizz")
                        .lilacTitle()
                    
                    Text("Are you ready to test out your sport skills?")
                        .foregroundColor(.white)
                }
                
                NavigationLink {
                    TriviaView()
                        .environmentObject(quizManager)
                } label: {
                    PrimaryButton(text: "Let´s Go!")
                }
                
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .edgesIgnoringSafeArea(.all)
            .background(Color(hue: 0.615, saturation: 0.615, brightness: 0.331))
        }
    }
}

#Preview {
    ContentView()
        .environmentObject(QuizManager())
}
