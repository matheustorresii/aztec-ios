//
//  HomeView.swift
//  Aztec
//
//  Created by Matheus Torres on 13/08/23.
//

import Combine
import SwiftUI

struct HomeView: View, NavigableView {
    var navigate: PassthroughSubject<FlowNavigationStyle, Never> = .init()
    
    var body: some View {
        ZStack {
            BookView()
        }
    }
}
