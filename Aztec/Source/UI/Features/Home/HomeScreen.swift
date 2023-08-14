//
//  HomeScreen.swift
//  Aztec
//
//  Created by Matheus Torres on 13/08/23.
//

import Combine
import SwiftUI

struct HomeScreen: View, NavigableView {
    var navigation: PassthroughSubject<FlowNavigationStyle, Never> = .init()
    
    var body: some View {
        VStack(spacing: 0) {
            HeaderView(leftLabel: "?", rightLabel: "Ξ") {
                navigation.send(.push(.quizList))
            } rightAction: {
                navigation.send(.push(.settings))
            }
            
            BookView()
        }
    }
}
