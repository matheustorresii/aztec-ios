//
//  OnboardingView.swift
//  Aztec
//
//  Created by Matheus Torres on 20/08/23.
//

import SwiftUI

struct OnboardingView: View {
    let didTap: (() -> Void)?
    
    var body: some View {
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
                self.didTap?()
            }
            .gesture(DragGesture().onEnded { _ in
                self.didTap?()
            })
        }
    }
}

struct OnboardingView_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingView(didTap: nil)
    }
}
