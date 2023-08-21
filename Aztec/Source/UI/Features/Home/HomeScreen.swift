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
                .if(shouldShowChapterSelector) { view in
                    view.overlay {
                        buildChapterSelector()
                    }
                }
        }
        .if(shouldShowOnboarding) { view in
            view.overlay {
                OnboardingView(didTap: didTapOnboarding)
            }
        }
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
    
    private func didTap(chapter selectedChapter: Chapter) {
        shouldShowChapterSelector.toggle()
        chapter = selectedChapter
    }
    
    @ViewBuilder
    private func buildChapterSelector() -> some View {
        ZStack {
            Color.black.opacity(0.75).ignoresSafeArea()
            ScrollView {
                VStack(spacing: 0) {
                    ForEach(Array(Chapter.allCases.enumerated()), id: \.offset) { (index, chapter) in
                        Button {
                            didTap(chapter: chapter)
                        } label: {
                            ItemCellView(index: index, label: chapter.title)
                        }
                        .tint(.primary)
                    }
                }
            }
            .onTapGesture {
                shouldShowChapterSelector.toggle()
            }
        }
    }
}
