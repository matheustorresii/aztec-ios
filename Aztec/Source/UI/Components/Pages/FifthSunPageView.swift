//
//  FifthSunPageView.swift
//  Aztec
//
//  Created by Matheus Torres on 14/08/23.
//

import SwiftUI

struct FifthSunPageView: View {
    @State private var sunRotation = 0.0
    @State private var planetAnimated: Bool = false
    
    var body: some View {
        ZStack {
            Image("sun-5")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .rotationEffect(.degrees(sunRotation), anchor: .center)
                .offset(x: 0, y: -70)
                .padding(30)
                .onAppear {
                    withAnimation(.linear(duration: 20).repeatForever(autoreverses: false)) {
                        sunRotation = 360
                    }
                }
            Image("planet")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .rotationEffect(planetAnimated ? .degrees(-5) : .degrees(5))
                .offset(x: 0, y: 35)
                .padding(70)
                .onAppear {
                    withAnimation(.linear(duration: 0.1).repeatForever()) {
                        planetAnimated.toggle()
                    }
                }
        }
        .padding(.vertical, -55)
    }
}

struct FifthSunPageView_Previews: PreviewProvider {
    static var previews: some View {
        FifthSunPageView()
    }
}
