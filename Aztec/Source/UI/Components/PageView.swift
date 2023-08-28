//
//  PageView.swift
//  Aztec
//
//  Created by Matheus Torres on 13/08/23.
//

import SwiftUI

struct PageView: View {
    let page: PageProtocol
    let didAppearWithText: ((String) -> Void)?
    
    var body: some View {
        VStack(alignment: .center, spacing: 24) {
            Spacer()
            
            if let topText = page.topText {
                buildText(topText)
            }
            
            buildAnimation()
            
            if let bottomText = page.bottomText {
                buildText(bottomText)
            }
            
            Spacer()
        }
        .contentShape(Rectangle())
        .onAppear {
            didAppearWithText?(buildText())
        }
    }
    
    private func buildText() -> String {
        var fullText: String = .empty
        
        if let pageTopText = page.topText {
            fullText += NSLocalizedString(pageTopText, comment: .empty)
        }
        
        if let pageBottomText = page.bottomText {
            if page.topText != nil {
                fullText += .space
            }
            fullText += NSLocalizedString(pageBottomText, comment: .empty)
        }
        return fullText
    }
    
    @ViewBuilder
    private func buildAnimation() -> some View {
        page.view
    }
    
    @ViewBuilder
    private func buildText(_ text: String) -> some View {
        Text(LocalizedStringKey(text))
            .font(.pressStart(size: 12))
            .multilineTextAlignment(.center)
            .padding(.horizontal, 16)
            .zIndex(2)
    }
}
