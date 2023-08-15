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
            Color.primary.frame(width: 2)
            HStack {
                Spacer()
                Text("\(quiz.title)")
                    .font(.pressStart(size: 24))
                    .multilineTextAlignment(.center)
                    .zIndex(2)
                Spacer()
            }
        }
        .border(.primary, width: 4)
        .frame(height: 95)
        .padding(.top, 16)
        .padding(.horizontal, 16)
    }
}

struct QuizListCellView_Previews: PreviewProvider {
    static var previews: some View {
        QuizListCellView(index: 98,
                         quiz: .init(title: "Test Quiz", questions: []))
    }
}
