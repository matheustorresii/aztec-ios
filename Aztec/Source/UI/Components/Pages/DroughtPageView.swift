//
//  DroughtPageView.swift
//  Aztec
//
//  Created by Matheus Torres on 14/08/23.
//

import SwiftUI

struct DroughtPageView: View {
    @State private var planetAnimated: Bool = false
    
    var body: some View {
        ZStack {
            Image("planet-drought")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .padding(50)
                .rotationEffect(planetAnimated ? .degrees(-2) : .degrees(2))
                .onAppear {
                    withAnimation(.linear(duration: 1).repeatForever()) {
                        planetAnimated.toggle()
                    }
                }
            ExplosionView()
                .offset(x: -60, y: 50)
                .frame(width: 100, height: 100, alignment: .center)
            ExplosionView()
                .offset(x: -90, y: -80)
                .frame(width: 100, height: 100, alignment: .center)
            ExplosionView()
                .offset(x: -10, y: -80)
                .frame(width: 100, height: 100, alignment: .center)
            ExplosionView()
                .offset(x: 90, y: -60)
                .frame(width: 100, height: 100, alignment: .center)
            ExplosionView()
                .offset(x: 20, y: -10)
                .frame(width: 100, height: 100, alignment: .center)
            ExplosionView()
                .offset(x: 70, y: 60)
                .frame(width: 100, height: 100, alignment: .center)
        }
        .padding(.vertical, -55)
    }
}

struct ExplosionView: View {
    @State private var id = 1
    
    private let timer = Timer.publish(every: 0.2, on: .main, in: .common).autoconnect()
    
    var body: some View {
        Image("explosion-\(id)")
            .resizable()
            .aspectRatio(contentMode: .fit)
            .shadow(color: .black, radius: 20)
            .onReceive(timer) { _ in
                id = id == 4 ? 1 : id + 1
            }
    }
}

struct DroughtPageView_Previews: PreviewProvider {
    static var previews: some View {
        DroughtPageView()
    }
}
