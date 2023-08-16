//
//  OnboardingView.swift
//  Aztec
//
//  Created by Matheus Torres on 15/08/23.
//

import SwiftUI

struct OnboardingView: View {
    @AppStorage(Constants.AppStorage.shouldShowOnboarding.rawValue)
    private var onboarding: Bool = false
    
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

struct OnboardingView_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingView()
    }
}
