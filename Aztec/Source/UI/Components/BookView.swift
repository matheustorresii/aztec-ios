//
//  BookView.swift
//  Aztec
//
//  Created by Matheus Torres on 13/08/23.
//

import AVKit
import SwiftUI

struct BookView: View {
    
    @AppStorage(Constants.AppStorage.autoSpeech.rawValue)
    private var autoSpeech: Bool = false
    
    @State private var isBack: Bool = false
    private let synthesizer = AVSpeechSynthesizer()
    
    @Binding var page: PageProtocol
    
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
        if page.value.isMultiple(of: 2) {
            PageView(page: page) { speak($0) }
        } else {
            PageView(page: page) { speak($0) }
        }
    }
    
    private func endedDragGestureWith(_ value: CGFloat) {
        if value > 0.1 {
            isBack = true
            withAnimation {
                guard let previousPage = page.previous else { return }
                page = previousPage
            }
        }
        if value < -0.1 {
            isBack = false
            withAnimation {
                guard let nextPage = page.next else { return }
                page = nextPage
            }
        }
    }
    
    private func speak(_ string: String) {
        synthesizer.stopSpeaking(at: .immediate)
        guard autoSpeech, let identifier = identifierForVoice() else { return }
        let utterance = AVSpeechUtterance(string: string)
        utterance.voice = .init(identifier: identifier)
        synthesizer.speak(utterance)
    }
    
    private func identifierForVoice() -> String? {
        let code = AVSpeechSynthesisVoice.currentLanguageCode()
        if code.hasPrefix("en") {
            return "com.apple.ttsbundle.Samantha-compact"
        }
        if code.hasPrefix("es") {
            return "com.apple.ttsbundle.Paulina-compact"
        }
        if code.hasPrefix("pt") {
            return "com.apple.ttsbundle.Luciana-compact"
        }
        return nil
    }
}
