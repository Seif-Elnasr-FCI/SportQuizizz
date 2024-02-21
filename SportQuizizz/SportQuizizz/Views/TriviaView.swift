//
//  TriviaView.swift
//  SportQuizizz
//
//  Created by seif elshahet on 10/01/2024.
//

import SwiftUI

struct TriviaView: View {
    @EnvironmentObject var quizManager: QuizManager
    var body: some View {
        if quizManager.reachedEnd {
            VStack(spacing: 20) {
                Text("SportQuizizz")
                    .lilacTitle()
                
                Text("Congratulations! you completed the game! 🏆")
                    .foregroundColor(.white)
                
                Text("Your score is \(quizManager.score) of \(quizManager.length)")
                    .foregroundColor(.white)
                
                Button {
                    Task.init {
                        await quizManager.fetchQuiz()
                    }
                } label: {
                    PrimaryButton(text: "Play Again!")
                }
            }
            .foregroundColor(Color("AccentColor"))
            .padding()
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color(hue: 0.615, saturation: 0.615, brightness: 0.331))
            .navigationBarHidden(true)
        } else {
            QuestionView()
                .environmentObject(quizManager)
        }
    }
}

#Preview {
    TriviaView()
        .environmentObject(QuizManager())
}
