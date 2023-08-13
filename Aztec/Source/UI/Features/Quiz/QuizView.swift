//
//  QuizView.swift
//  Aztec
//
//  Created by Matheus Torres on 13/08/23.
//

import Combine
import SwiftUI

struct QuizView: View, NavigableView {
    var navigate: PassthroughSubject<FlowNavigationStyle, Never> = .init()
    
    var body: some View {
        Text("This is Quiz")
        Button {
            navigate.send(.pop)
        } label: {
            Text("Go back to Home")
        }
    }
}
