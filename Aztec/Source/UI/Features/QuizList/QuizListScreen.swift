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
            HeaderView(title: "Quizzes", leftLabel: "<", leftAction: {
                navigation.send(.pop)
            })
            QuizListView { quiz in
                navigation.send(.push(.quiz(quiz)))
            }
        }
    }
}
