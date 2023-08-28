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
    
    @State private var shouldShowChapterSelector: Bool = false
    @State private var page: PageProtocol = Chapter.sun.page
    
    var navigation: PassthroughSubject<FlowNavigationStyle, Never> = .init()
    
    var body: some View {
        VStack(spacing: 0) {
            HeaderView(title: page.title,
                       leftLabel: "?",
                       rightLabel: "Ξ",
                       titleAction: didTapTitle,
                       leftAction: didTapLeftIcon,
                       rightAction: didTapRightIcon)
            
            BookView(page: $page)
                .overlay(shouldShowChapterSelector
                         ? ChapterSelectorView(shouldShowChapterSelector: $shouldShowChapterSelector, page: $page)
                         : nil)
        }
        .overlay(shouldShowOnboarding ? OnboardingView(didTap: didTapOnboarding) : nil)
    }
    
    private func didTapTitle() {
        shouldShowChapterSelector.toggle()
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
