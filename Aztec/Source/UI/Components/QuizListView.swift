//
//  QuizListView.swift
//  Aztec
//
//  Created by Matheus Torres on 14/08/23.
//

import SwiftUI

struct QuizListView: View {
    
    var navigateToQuiz: ((Quiz) -> ())?
    
    var body: some View {
        ScrollView(showsIndicators: false) {
            VStack {
                Spacer().frame(height: 16)
                ForEach(Array(quizzes.enumerated()), id: \.offset) { index, quiz in
                    Button {
                        didTap(quiz: quiz)
                    } label: {
                        QuizListCellView(index: index, quiz: quiz)
                    }
                    .tint(.primary)
                }
            }
        }
    }
    
    private func didTap(quiz: Quiz) {
        navigateToQuiz?(quiz)
    }
}
