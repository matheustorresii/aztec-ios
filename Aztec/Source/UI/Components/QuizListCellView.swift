//
//  QuizListCellView.swift
//  Aztec
//
//  Created by Matheus Torres on 14/08/23.
//

import SwiftUI

struct QuizListCellView: View {
    
    let index: Int
    let quiz: Quiz
    
    var body: some View {
        HStack {
            Text("\(index + 1)")
                .font(.pressStart(size: 40))
                .multilineTextAlignment(.center)
                .zIndex(2)
                .frame(width: 90)
            Color.black.frame(width: 2)
            Text("\(quiz.title)")
                .font(.pressStart(size: 24))
                .multilineTextAlignment(.center)
                .zIndex(2)
        }
        .padding(8)
        .border(.black, width: 4)
        .frame(height: 95)
    }
}

struct QuizListCellView_Previews: PreviewProvider {
    static var previews: some View {
        QuizListCellView(index: 98,
                         quiz: quizzes.first ?? .init(title: .empty,
                                                      questions: []))
    }
}
