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
                Text(LocalizedStringKey(topText))
                    .font(.pressStart(size: 12))
                    .multilineTextAlignment(.center)
            }
            
            buildAnimation()
                .aspectRatio(1, contentMode: .fit)
            
            if let bottomText = page.bottomText {
                Text(LocalizedStringKey(bottomText))
                    .font(.pressStart(size: 12))
                    .multilineTextAlignment(.center)
            }
        }
        .padding(.horizontal, 16)
    }
    
    @ViewBuilder
    private func buildAnimation() -> some View {
        switch page {
        default:
            GodsPageView()
        }
    }
}
