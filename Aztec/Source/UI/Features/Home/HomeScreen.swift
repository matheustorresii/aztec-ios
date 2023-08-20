//
//  HomeScreen.swift
//  Aztec
//
//  Created by Matheus Torres on 13/08/23.
//

import Combine
import SwiftUI

struct HomeScreen: View, NavigableView {
//    @AppStorage(Constants.AppStorage.shouldShowOnboarding.rawValue)
    @State
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
                GeometryReader { geometry in
                    ZStack {
                        Color.black.opacity(0.75).ignoresSafeArea()
                        Text(LocalizedStringKey("Swipe right to proceed"))
                            .font(.pressStart(size: 12))
                            .foregroundColor(.black)
                            .multilineTextAlignment(.center)
                            .padding(.horizontal, 16)
                            .zIndex(2)
                            .offset(x: -2, y: 2)
                        Text(LocalizedStringKey("Swipe right to proceed"))
                            .font(.pressStart(size: 12))
                            .foregroundColor(.white)
                            .multilineTextAlignment(.center)
                            .padding(.horizontal, 16)
                            .zIndex(2)
                    }
                    .gesture(DragGesture().onEnded { value in
                        let translation = value.translation.width / geometry.frame(in: .global).width
                        self.endedDragGestureWith(translation)
                    })
                }
            }
        }
    }
    
    private func endedDragGestureWith(_ value: CGFloat) {
        if value > 0.1 {
            shouldShowOnboarding = false
        }
        if value < -0.1 {
            shouldShowOnboarding = false
        }
    }
}
