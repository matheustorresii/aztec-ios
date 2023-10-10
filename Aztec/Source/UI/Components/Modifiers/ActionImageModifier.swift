//
//  ActionImageModifier.swift
//  Aztec X
//
//  Created by Matheus Torres on 07/09/23.
//

import SwiftUI

struct ActionImageModifier: ViewModifier {
    var innerView: AnyView
    
    @State private var state: Bool = false
    
    func body(content: Content) -> some View {
        Button {
            state.toggle()
        } label: {
            content
        }
        .bottomsheet(state: $state, innerView: innerView)
    }
}

extension View {
    func actionImage(innerView: AnyView) -> some View {
        modifier(ActionImageModifier(innerView: innerView))
    }
}

struct ActionImageModifier_Previews: PreviewProvider {
    static var previews: some View {
        Image("quail")
            .resizable()
            .aspectRatio(contentMode: .fit)
            .padding(25)
            .actionImage(innerView: Text("Boa noite").toAny())
    }
}
