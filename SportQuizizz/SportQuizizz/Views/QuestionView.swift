//
//  QuestionView.swift
//  SportQuizizz
//
//  Created by seif elshahet on 10/01/2024.
//

import SwiftUI

struct QuestionView: View {
    @EnvironmentObject var quizManager: QuizManager
    var body: some View {
        VStack(spacing: 40) {
            HStack {
                Text("Sport Quizizz")
                    .lilacTitle()
                
                Spacer()
                
                Text("\(quizManager.index + 1) of \(quizManager.length)")
                    .foregroundColor(.white)
                    .fontWeight(.heavy)
            }
            
            ProgressBar(progress: quizManager.progress)
            
            VStack(alignment: .leading, spacing: 20) {
                Text(quizManager.question)
                    .font(.system(size: 20).bold())
                    .foregroundColor(/*@START_MENU_TOKEN@*/Color(hue: 1.0, saturation: 0.024, brightness: 0.877)/*@END_MENU_TOKEN@*/)
                
                ForEach(quizManager.answerChoices, id: \.id) { answer in
                    AnswerRow(answer: answer)
                        .environmentObject(quizManager)
                }
            }
            
            Button {
                quizManager.goToNextQuestion()
            } label: {
                PrimaryButton(text: "Next", background: quizManager.answerSelected ? Color("AccentColor") : Color(hue: 1.0, saturation: 0.0, brightness: 0.564, opacity: 0.327))
            }
            .disabled(!quizManager.answerSelected)
            
            Spacer()
            
        }
        .padding()
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color(hue: 0.615, saturation: 0.615, brightness: 0.331))
        .navigationBarHidden(true)
    }
}

#Preview {
    QuestionView()
        .environmentObject(QuizManager())
}
