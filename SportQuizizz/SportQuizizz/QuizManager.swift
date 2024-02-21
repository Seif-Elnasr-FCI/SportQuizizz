//
//  QuizManager.swift
//  SportQuizizz
//
//  Created by seif elshahet on 10/01/2024.
//

import Foundation
import SwiftUI

class QuizManager: ObservableObject {
    private(set) var quiz: [Quiz.Result] = []
    @Published private(set) var length = 0
    @Published private(set) var index = 0
    @Published private(set) var reachedEnd = false
    @Published private(set) var answerSelected = false
    @Published private(set) var question: AttributedString = ""
    @Published private(set) var answerChoices: [Answer] = []
    @Published private(set) var progress: CGFloat = 0.00
    @Published private(set) var score = 0
    
    init() {
        Task.init {
            await fetchQuiz()
        }
    }
    
    func fetchQuiz() async {
        guard let url = URL(string: "https://opentdb.com/api.php?amount=10&category=21") else { fatalError("Missing URL") }
        
        let urlRequest = URLRequest(url: url)
        
        do {
            let (data, response) = try await URLSession.shared.data(for: urlRequest)
            guard (response as? HTTPURLResponse)?.statusCode == 200 else { fatalError("Error while fetching data") }
            
            let decoder = JSONDecoder()
            decoder.keyDecodingStrategy = .convertFromSnakeCase
            let decodedData = try decoder.decode(Quiz.self, from: data)
            
            DispatchQueue.main.async {
                self.index = 0
                self.score = 0
                self.progress = 0.00
                self.reachedEnd = false
                
                self.quiz = decodedData.results
                self.length = self.quiz.count
                self.setQuestion()
            }
            
        } catch {
            print("Error fetching quiz: \(error)")
        }
    }
    
    func goToNextQuestion() {
        if index + 1 < length {
            index += 1
            setQuestion()
        } else {
            reachedEnd = true
        }
    }
    
    func setQuestion() {
            answerSelected = false
            progress = CGFloat(Double((index + 1)) / Double(length) * 350)

            // Only setting next question if index is smaller than the trivia's length
            if index < length {
                let currentTriviaQuestion = quiz[index]
                question = currentTriviaQuestion.formattedQuestion
                answerChoices = currentTriviaQuestion.answers
            }
        }
    
    func selectAnswer(answer: Answer) {
        answerSelected = true
        if answer.isCorrect {
            score += 1
        }
    }
}
