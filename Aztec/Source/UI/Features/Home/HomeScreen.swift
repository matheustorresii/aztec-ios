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
            
            BookView(page: SunPages.start)
        }
        .if(shouldShowOnboarding) { view in
            view.overlay {
                GeometryReader { geometry in
                    ZStack {
                        Color.black.opacity(0.75).ignoresSafeArea()
                        Text(LocalizedStringKey("home.swipe".localized()))
                            .font(.pressStart(size: 12))
                            .foregroundColor(.black)
                            .multilineTextAlignment(.center)
                            .padding(.horizontal, 24)
                            .offset(x: -2, y: 2)
                        Text(LocalizedStringKey("home.swipe".localized()))
                            .font(.pressStart(size: 12))
                            .foregroundColor(.white)
                            .multilineTextAlignment(.center)
                            .padding(.horizontal, 24)
                    }
                    .onTapGesture {
                        self.didTapOnboarding()
                    }
                    .gesture(DragGesture().onEnded { _ in
                        self.didTapOnboarding()
                    })
                }
            }
        }
    }
    
    private func didTapOnboarding() {
        shouldShowOnboarding = false
    }
}
