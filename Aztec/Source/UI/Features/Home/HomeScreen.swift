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
    
    @State private var chapter: Chapter = .sun
    
    var navigation: PassthroughSubject<FlowNavigationStyle, Never> = .init()
    
    var body: some View {
        VStack(spacing: 0) {
            HeaderView(title: chapter.title,
                       leftLabel: "?",
                       rightLabel: "Ξ",
                       titleAction: didTapTitle,
                       leftAction: didTapLeftIcon,
                       rightAction: didTapRightIcon)
            
            BookView(page: chapter.page)
        }
        .if(shouldShowOnboarding) { view in
            view.overlay {
                OnboardingView(didTap: didTapOnboarding)
            }
        }
    }
    
    private func didTapTitle() {
        print("didTapTitle")
    }
    
    private func didTapLeftIcon() {
        navigation.send(.push(.quizList))
    }
    
    private func didTapRightIcon() {
        navigation.send(.push(.settings))
    }
    
    private func didTapOnboarding() {
        shouldShowOnboarding = false
    }
}
