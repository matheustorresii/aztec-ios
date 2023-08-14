//
//  GodsPageView.swift
//  Aztec
//
//  Created by Matheus Torres on 13/08/23.
//

import SwiftUI

struct GodsPageView: View {
    @State private var rotation = 0.0
    
    var body: some View {
        VStack(spacing: 0) {
            HStack(spacing: 0) {
                Image("serpent")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .padding(10)
                    .rotationEffect(.degrees(-rotation))
                
                Image("jaguar")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .padding(10)
                    .rotationEffect(.degrees(-rotation))
            }
            HStack(spacing: 0) {
                Image("hummingbird")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .padding(10)
                    .rotationEffect(.degrees(-rotation))
                Image("quail")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .padding(25)
                    .rotationEffect(.degrees(-rotation))
            }
        }
        .rotationEffect(.degrees(rotation))
        .onAppear {
            withAnimation(.linear(duration: 20).repeatForever(autoreverses: false)) {
                rotation = 360
            }
        }
    }
}
