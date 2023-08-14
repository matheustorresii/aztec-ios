//
//  PageView.swift
//  Aztec
//
//  Created by Matheus Torres on 13/08/23.
//

import SwiftUI

struct PageView: View {
    let page: Pages
    
    var body: some View {
        VStack(alignment: .center, spacing: 24) {
            if let topText = page.topText {
                buildText(topText)
            }
            
            buildAnimation()
                .aspectRatio(1, contentMode: .fit)
            
            if let bottomText = page.bottomText {
                buildText(bottomText)
            }
        }
    }
    
    @ViewBuilder
    private func buildAnimation() -> some View {
        switch page {
        case .beginning:
            BeginningPageView()
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
        }
    }
    
    @ViewBuilder
    private func buildText(_ text: String) -> some View {
        Text(LocalizedStringKey(text))
            .font(.pressStart(size: 12))
            .multilineTextAlignment(.center)
            .padding(.horizontal, 16)
    }
}
