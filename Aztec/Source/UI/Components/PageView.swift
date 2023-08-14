//
//  PageView.swift
//  Aztec
//
//  Created by Matheus Torres on 13/08/23.
//

import SwiftUI

struct PageView: View {
    let page: Pages
    let didAppearWithText: ((String) -> ())?
    
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
        switch page {
        case .gods:
            GodsPageView()
        case .firstSun:
            FirstSunPageView()
        case .herd:
            HerdPageView()
        case .secondSun:
            SecondSunPageView()
        case .hurricane:
            HurricanePageView()
        case .thirdSun:
            ThirdSunPageView()
        case .drought:
            DroughtPageView()
        case .fourthSun:
            FourthSunPageView()
        case .flood:
            FloodPageView()
        case .moon:
            MoonPageView()
        case .human:
            HumanPageView()
        case .fifthSun:
            FifthSunPageView()
        default:
            Text(String.empty)
        }
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
