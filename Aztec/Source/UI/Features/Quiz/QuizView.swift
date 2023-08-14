//
//  QuizView.swift
//  Aztec
//
//  Created by Matheus Torres on 13/08/23.
//

import Combine
import SwiftUI

struct QuizView: View, NavigableView {
    var navigation: PassthroughSubject<FlowNavigationStyle, Never> = .init()
    
    var body: some View {
        VStack {
            HeaderView(title: "Quiz", leftLabel: "<", leftAction: {
                navigation.send(.pop)
            })
        }
    }
}
