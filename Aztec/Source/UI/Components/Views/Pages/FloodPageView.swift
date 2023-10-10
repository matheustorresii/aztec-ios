//
//  FloodPageView.swift
//  Aztec
//
//  Created by Matheus Torres on 14/08/23.
//

import SwiftUI
import SpriteKit

struct FloodPageView: View {
    @State private var planetAnimated: Bool = false
    
    private var scene: SKScene {
        let scene = RainScene()
        scene.size = UIScreen.main.bounds.size
        scene.scaleMode = .fill
        scene.backgroundColor = .clear
        return scene
    }
    
    var body: some View {
        ZStack {
            SpriteView(scene: scene, options: [.allowsTransparency])
                .ignoresSafeArea()
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
        .aspectRatio(1, contentMode: .fit)
        .padding(.vertical, -25)
    }
}

class RainScene: SKScene {
    let rainEmitter: SKEmitterNode? = .init(fileNamed: "Rain.sks")
    
    override func didMove(to view: SKView) {
        guard let rainEmitter else { return }
        addChild(rainEmitter)
        rainEmitter.position.y = self.frame.maxY
        rainEmitter.particlePositionRange.dx = self.frame.width * 2.5
        view.allowsTransparency = true
    }
}
