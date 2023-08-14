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
            if let topText = topText() {
                Text(topText)
                    .font(.pressStart(size: 14))
                    .multilineTextAlignment(.center)
            }
            
            buildAnimation()
                .aspectRatio(1, contentMode: .fit)
            
            if let bottomText = bottomText() {
                Text(bottomText)
                    .font(.pressStart(size: 14))
                    .multilineTextAlignment(.center)
            }
        }
    }
    
    @ViewBuilder
    private func buildAnimation() -> some View {
        switch page {
        case .first:
            GodsPageView()
        case .second:
            GodsPageView()
        case .third:
            GodsPageView()
        }
    }
    
    private func topText() -> String? {
        switch page {
        case .first:
            return "Texto muito grande aqui sério que texto grande eu acho que não consigo dizer como esse texto é grande"
        case .second:
            return "Texto 2"
        case .third:
            return nil
        }
    }
    
    private func bottomText() -> String? {
        switch page {
        case .first:
            return "Esse texto não é tão grande assim"
        case .second:
            return nil
        case .third:
            return "Esse texto é bem maior do que aquele texto de baixo da primeira página ta ligado"
        }
    }
}
