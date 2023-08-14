//
//  HomeView.swift
//  Aztec
//
//  Created by Matheus Torres on 13/08/23.
//

import Combine
import SwiftUI

struct HomeView: View, NavigableView {
    var navigation: PassthroughSubject<FlowNavigationStyle, Never> = .init()
    
    var body: some View {
        VStack {
            HeaderView(leftLabel: "?", rightLabel: "Ξ") {
                navigation.send(.push(.quiz))
            } rightAction: {
                navigation.send(.push(.settings))
            }
            
            BookView()
        }
    }
}
