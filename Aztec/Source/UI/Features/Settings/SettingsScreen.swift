//
//  SettingsScreen.swift
//  Aztec
//
//  Created by Matheus Torres on 14/08/23.
//

import Combine
import SwiftUI

struct SettingsScreen: View, NavigableView {
    var navigation: PassthroughSubject<FlowNavigationStyle, Never> = .init()
    
    var body: some View {
        VStack(spacing: 0) {
            HeaderView(title: "Settings", leftLabel: "<", leftAction: {
                navigation.send(.pop)
            })
        }
    }
}
