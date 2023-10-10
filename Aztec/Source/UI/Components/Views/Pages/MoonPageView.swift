//
//  MoonPageView.swift
//  Aztec
//
//  Created by Matheus Torres on 14/08/23.
//

import SwiftUI

struct MoonPageView: View {
    @State private var sunRotation = 0.0
    
    var body: some View {
        HStack(spacing: -200) {
            Image("sun-5")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .rotationEffect(.degrees(sunRotation), anchor: .center)
                .onAppear {
                    withAnimation(.linear(duration: 40).repeatForever(autoreverses: false)) {
                        sunRotation = 360
                    }
                }
            Image("moon-rabbit")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .padding(60)
                .rotationEffect(.degrees(sunRotation), anchor: .center)
                .onAppear {
                    withAnimation(.linear(duration: 40).repeatForever(autoreverses: false)) {
                        sunRotation = 360
                    }
                }
        }
        .padding(.vertical, -20)
        .rotationEffect(.degrees(sunRotation), anchor: .center)
        .onAppear {
            withAnimation(.linear(duration: 20).repeatForever(autoreverses: false)) {
                sunRotation = 360
            }
        }
    }
}

struct MoonPageView_Previews: PreviewProvider {
    static var previews: some View {
        GeometryReader { geometry in
            let rect = geometry.frame(in: .local)
            
            MoonPageView()
                .frame(width: rect.width, height: rect.width)
        }
    }
}
