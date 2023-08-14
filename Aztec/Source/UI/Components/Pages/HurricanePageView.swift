//
//  HurricanePageView.swift
//  Aztec
//
//  Created by Matheus Torres on 14/08/23.
//

import SwiftUI

struct HurricanePageView: View {
    
    @State private var planetAnimated: Bool = false
    
    var body: some View {
        ZStack {
            Image("planet")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .padding(50)
                .rotationEffect(planetAnimated ? .degrees(-2) : .degrees(2))
                .onAppear {
                    withAnimation(.linear(duration: 1).repeatForever()) {
                        planetAnimated.toggle()
                    }
                }
            HurricaneView()
                .offset(x: -30, y: 50)
                .frame(width: 100, height: 100, alignment: .center)
            HurricaneView()
                .offset(x: -70, y: -40)
                .frame(width: 100, height: 100, alignment: .center)
            HurricaneView()
                .offset(x: -10, y: -80)
                .frame(width: 100, height: 100, alignment: .center)
            HurricaneView()
                .offset(x: 70, y: -50)
                .frame(width: 100, height: 100, alignment: .center)
            HurricaneView()
                .offset(x: 40, y: 10)
                .frame(width: 100, height: 100, alignment: .center)
            HurricaneView()
                .offset(x: 85, y: 70)
                .frame(width: 100, height: 100, alignment: .center)
        }
        .padding(.vertical, -75)
    }
}

struct HurricaneView: View {
    @State private var rotation = 0.0
    @State private var id = 1
    
    private let timer = Timer.publish(every: 0.2, on: .main, in: .common).autoconnect()
    
    var body: some View {
        Image("hurricane-\(id)")
            .resizable()
            .aspectRatio(contentMode: .fit)
            .rotationEffect(.degrees(-rotation), anchor: .center)
            .shadow(color: .black, radius: 20)
            .onAppear {
                withAnimation(.linear(duration: 2).repeatForever(autoreverses: false)) {
                    rotation = 360
                }
            }
            .onReceive(timer) { _ in
                withAnimation {
                    id = id == 4 ? 1 : id + 1
                }
            }
    }
}

struct HurricanePageView_Previews: PreviewProvider {
    static var previews: some View {
        HurricanePageView()
    }
}
