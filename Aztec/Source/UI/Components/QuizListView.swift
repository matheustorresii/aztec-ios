//
//  QuizListView.swift
//  Aztec
//
//  Created by Matheus Torres on 14/08/23.
//

import SwiftUI

struct QuizListView: View {
    
    var body: some View {
        ScrollView(showsIndicators: false) {
            VStack {
                Spacer().frame(height: 16)
                ForEach(Array(quizzes.enumerated()), id: \.offset) { index, quiz in
                    QuizListCellView(index: index, quiz: quiz)
                }
            }
        }
    }
}
