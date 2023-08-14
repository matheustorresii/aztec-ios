//
//  BookView.swift
//  Aztec
//
//  Created by Matheus Torres on 13/08/23.
//

import SwiftUI

struct BookView: View {
    
    @State private var page: Pages = .beggining
    @State private var isBack: Bool = false
    
    var body: some View {
        GeometryReader { geometry in
            buildPage()
                .position(x: geometry.frame(in: .local).midX, y: geometry.frame(in: .local).midY)
                .transition(.asymmetric(
                    insertion: .move(edge: isBack ? .leading : .trailing),
                    removal: .move(edge: isBack ? .trailing : .leading)))
                .gesture(DragGesture().onEnded { value in
                    let translation = value.translation.width / geometry.frame(in: .global).width
                    self.endedDragGestureWith(translation)
                })
        }
    }
    
    @ViewBuilder
    private func buildPage() -> some View {
        switch page {
        case .beggining,
                .firstSun,
                .secondSun,
                .thirdSun,
                .fourthSun,
                .moon,
                .fifthSun:
            PageView(page: page)
        case .gods,
                .herd,
                .hurricane,
                .drought,
                .flood,
                .humans:
            PageView(page: page)
        }
    }
    
    private func endedDragGestureWith(_ value: CGFloat) {
        if value > 0.15 {
            isBack = true
            withAnimation {
                guard let previousPage = page.previous else { return }
                page = previousPage
            }
        }
        if value < 0.15 {
            isBack = false
            withAnimation {
                guard let nextPage = page.next else { return }
                page = nextPage
            }
        }
    }
}
