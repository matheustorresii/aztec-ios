//
//  QuizScreen.swift
//  Aztec
//
//  Created by Matheus Torres on 13/08/23.
//

import Combine
import SwiftUI

struct QuizScreen: View, NavigableView {
    var quiz: Quiz
    var navigation: PassthroughSubject<FlowNavigationStyle, Never> = .init()
    
    var body: some View {
        VStack(spacing: 0) {
            HeaderView(title: quiz.title, leftLabel: "<", leftAction: {
                navigation.send(.pop)
            })
        }
    }
}
