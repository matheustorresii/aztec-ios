//
//  SwitchView.swift
//  Aztec
//
//  Created by Matheus Torres on 14/08/23.
//

import SwiftUI

struct SwitchView: View {
    @State private var state: Bool
    
    private let id: String
    
    var didTapSwitchWithId: ((String) -> ())?
    
    init(id: String = .empty, state: Bool, didTapSwitchWithId: ((String) -> ())? = nil) {
        self.id = id
        self.state = state
        self.didTapSwitchWithId = didTapSwitchWithId
    }
    
    var body: some View {
        Button {
            state.toggle()
            didTapSwitchWithId?(id)
        } label: {
            SwitchInnerView(state: $state)
                .background {
                    Rectangle()
                        .fill(.black)
                        .offset(.init(width: -10, height: 10))
                }
        }
    }
}

struct SwitchInnerView: View {
    @Binding var state: Bool
    
    var body: some View {
        ZStack {
            buildBackground()
            
            VStack {
                Color.clear
                Color.clear
                Color.primary
                    .opacity(0.5)
                    .padding(8)
            }
            HStack {
                buildToggle()
            }
            .border(Color.primary, width: 4)
        }
        .aspectRatio(2, contentMode: .fit)
    }
    
    @ViewBuilder
    private func buildBackground() -> some View {
        if state {
            Rectangle().fill(.green)
        } else {
            Rectangle().fill(.bar)
        }
    }
    
    @ViewBuilder
    private func buildToggle() -> some View {
        if state {
            Spacer()
        }
        Rectangle()
            .fill(.white)
            .aspectRatio(1, contentMode: .fit)
            .border(Color.black, width: 4)
            .padding(16)
        if !state {
            Spacer()
        }
    }
}

struct SwitchView_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            SwitchView(state: false)
            SwitchView(state: true)
        }
        .padding(16)
    }
}
