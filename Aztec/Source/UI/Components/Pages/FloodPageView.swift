//
//  FloodPageView.swift
//  Aztec
//
//  Created by Matheus Torres on 14/08/23.
//

import SwiftUI

struct FloodPageView: View {
    @State private var planetAnimated: Bool = false
    
    var body: some View {
        Image("planet-flooded")
            .resizable()
            .aspectRatio(contentMode: .fit)
            .padding(50)
            .rotationEffect(planetAnimated ? .degrees(-2) : .degrees(2))
            .onAppear {
                withAnimation(.linear(duration: 1).repeatForever()) {
                    planetAnimated.toggle()
                }
            }
    }
}

struct FloodPageView_Previews: PreviewProvider {
    static var previews: some View {
        FloodPageView()
    }
}
