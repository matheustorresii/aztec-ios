//
//  BookView.swift
//  Aztec
//
//  Created by Matheus Torres on 13/08/23.
//

import SwiftUI

struct BookView: View {
    
    @State private var page: Pages = .beginning
    @State private var isBack: Bool = false
    
    var body: some View {
        GeometryReader { geometry in
            buildPage()
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
        if page.rawValue.isMultiple(of: 2) {
            PageView(page: page)
        } else {
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
