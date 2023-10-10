//
//  SecondSunPageView.swift
//  Aztec
//
//  Created by Matheus Torres on 14/08/23.
//

import SwiftUI

struct SecondSunPageView: View {
    @State private var sunRotation = 0.0
    @State private var planetAnimated: Bool = false
    
    var body: some View {
        ZStack {
            Image("sun-2")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .rotationEffect(.degrees(sunRotation), anchor: .center)
                .offset(x: -70, y: -35)
                .padding(50)
                .onAppear {
                    withAnimation(.linear(duration: 20).repeatForever(autoreverses: false)) {
                        sunRotation = 360
                    }
                }
            Image("planet")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .rotationEffect(planetAnimated ? .degrees(-2) : .degrees(2))
                .offset(x: 35, y: 35)
                .padding(70)
                .onAppear {
                    withAnimation(.linear(duration: 1).repeatForever()) {
                        planetAnimated.toggle()
                    }
                }
        }
        .padding(.vertical, -55)
    }
}

struct SecondSunPageView_Previews: PreviewProvider {
    static var previews: some View {
        SecondSunPageView()
    }
}
