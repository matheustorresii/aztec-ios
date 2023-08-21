//
//  QuizListScreen.swift
//  Aztec
//
//  Created by Matheus Torres on 14/08/23.
//

import Combine
import SwiftUI

struct QuizListScreen: View, NavigableView {
    var navigation: PassthroughSubject<FlowNavigationStyle, Never> = .init()
    
    var body: some View {
        VStack(spacing: 0) {
            HeaderView(title: "title.quiz".localized(), leftLabel: "<", leftAction: {
                navigation.send(.pop)
            })
            
            ScrollView(showsIndicators: false) {
                ForEach(Array(quizList().enumerated()), id: \.offset) { index, quiz in
                    Button {
                        navigation.send(.push(.quiz(quiz)))
                    } label: {
                        ItemCellView(index: index, label: quiz.title)
                    }
                    .tint(.primary)
                }
            }
        }
    }
    
    private func quizList() -> [Quiz] {
        Chapter.allCases.flatMap { $0.quiz }
    }
}
