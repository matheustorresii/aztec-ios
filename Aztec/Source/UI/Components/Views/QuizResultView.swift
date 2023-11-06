//
//  QuizResultView.swift
//  Aztec
//
//  Created by Matheus Torres on 14/08/23.
//

import SwiftUI

struct QuizResultView: View {
    let quiz: Quiz
    
    var body: some View {
        ScrollView(showsIndicators: false) {
            VStack {
                ForEach(Array(quiz.questions.enumerated()), id: \.offset) { index, question in
                    buildResultLine(index: index, question: question)
                }
            }
        }
    }
    
    @ViewBuilder
    private func buildResultLine(index: Int, question: Quiz.Question) -> some View {
        VStack(alignment: .center, spacing: 0) {
            Spacer().frame(height: 24)
            
            Text("\("main.question".localized()) \(index + 1)")
                .font(.pressStart(size: 28))
            
            Spacer().frame(height: 8)
            
            if let selected = question.selected {
                Text(selected.rawValue + ":")
                    .font(.pressStart(size: 24)) +
                Text(selected == question.answer ? "main.correct".localized() : "main.incorrect".localized())
                    .font(.pressStart(size: 24))
                    .foregroundColor(selected == question.answer ? .green : .red)
            }
            
            Spacer().frame(height: 24)
            
            Text(question.description)
                .font(.pressStart(size: 22))
            
            Spacer().frame(height: 24)
            
            if index != quiz.questions.count-1 {
                Color.primary.frame(height: 4)
            }
        }
    }
}

struct QuizResultView_Previews: PreviewProvider {
    static var previews: some View {
        QuizResultView(quiz: .init(title: "Teste",
                                   questions: [
                                    .init(question: "Pergunta 1",
                                          options: [],
                                          answer: .D,
                                          description: "Resposta da pergunta 1",
                                          selected: .A),
                                    .init(question: "Pergunta 2",
                                          options: [],
                                          answer: .C,
                                          description: "Resposta da pergunta 2",
                                          selected: .C),
                                    .init(question: "Pergunta 3",
                                          options: [],
                                          answer: .A,
                                          description: "Resposta da pergunta 3",
                                          selected: .D)
                                   ]))
    }
}
