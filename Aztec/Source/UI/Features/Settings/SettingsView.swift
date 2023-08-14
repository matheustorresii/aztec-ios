//
//  SettingsView.swift
//  Aztec
//
//  Created by Matheus Torres on 14/08/23.
//

import Combine
import SwiftUI

struct SettingsView: View, NavigableView {
    var navigation: PassthroughSubject<FlowNavigationStyle, Never> = .init()
    
    var body: some View {
        VStack {
            HeaderView(title: "Settings", leftLabel: "<", leftAction: {
                navigation.send(.pop)
            })
        }
    }
}
