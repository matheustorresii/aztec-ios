//
//  HomeScreen.swift
//  Aztec
//
//  Created by Matheus Torres on 13/08/23.
//

import Combine
import SwiftUI

struct HomeScreen: View, NavigableView {
    @AppStorage(Constants.AppStorage.shouldShowOnboarding.rawValue)
    private var shouldShowOnboarding: Bool = true
    
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
        .if(shouldShowOnboarding) { view in
            view.overlay {
                OnboardingView()
            }
        }
    }
}
